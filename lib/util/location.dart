import 'dart:math';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:avocado/domain/model/district_model.dart';

class Location {
  int latitude;
  int longitude;
  int x;
  int y;
  District district;

  Location({
    required this.latitude,
    required this.longitude,
    required this.x,
    required this.y,
    required this.district,
  });
}

class GridPosition {
  int x;
  int y;
  GridPosition({required this.x, required this.y});
}

class LamcParameter {
  double re; // 지도 반경
  double grid; // 격자 간격
  double slat1; // 표준 위도 1
  double slat2; // 표준 위도 2
  double olon; // 기준점 경도
  double olat; // 기준점 위도
  double xo; // 기준점 X 좌표
  double yo; // 기준점 Y 좌표
  int first; // 초기화 여부

  LamcParameter({
    required this.re,
    required this.grid,
    required this.slat1,
    required this.slat2,
    required this.olon,
    required this.olat,
    required this.xo,
    required this.yo,
    required this.first,
  });
}

class LocationUtil {
  factory LocationUtil() {
    return _instance;
  }

  LocationUtil._internal();

  static final LocationUtil _instance = LocationUtil._internal();

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  Future<bool> get permissionStatusIsDenied => Permission.location.isDenied;

  Future<bool> handlePermission() async {
    bool isPermitted = true;

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permissionStatus =
        await _geolocatorPlatform.checkPermission();

    if (permissionStatus == LocationPermission.denied ||
        permissionStatus == LocationPermission.deniedForever) {
      permissionStatus = await _geolocatorPlatform.requestPermission();
    }

    if (permissionStatus == LocationPermission.denied ||
        permissionStatus == LocationPermission.deniedForever) {
      isPermitted = false;
    }

    return isPermitted;
  }

  Future<Location?> getLocationFromAddress(String address) async {
    try {
      var positions = await locationFromAddress(address);

      var position = positions[0];

      GridPosition gridPosition = _converToGridPosition(
        position.longitude,
        position.latitude,
      );

      List<Placemark> placemark =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      District district = District(
        administrativeArea: placemark[0].administrativeArea ?? '',
        subLocality: placemark[0].subLocality ?? '',
        thoroughfare: placemark[0].thoroughfare ?? '',
      );

      return Location(
        latitude: position.latitude.toInt(),
        longitude: position.longitude.toInt(),
        x: gridPosition.x,
        y: gridPosition.y,
        district: district,
      );
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  Future<Location?> getLocation() async {
    try {
      final hasPermission = await handlePermission();

      if (!hasPermission) {
        return null;
      }

      final position = await _geolocatorPlatform.getCurrentPosition();

      GridPosition gridPosition = _converToGridPosition(
        position.longitude,
        position.latitude,
      );

      List<Placemark> placemark =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      District district = District(
        administrativeArea: placemark[0].administrativeArea ?? '',
        subLocality: placemark[0].subLocality ?? '',
        thoroughfare: placemark[0].thoroughfare ?? '',
      );

      return Location(
        latitude: position.latitude.toInt(),
        longitude: position.longitude.toInt(),
        x: gridPosition.x,
        y: gridPosition.y,
        district: district,
      );
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  GridPosition _converToGridPosition(
    double lon,
    double lat,
  ) {
    double PI = 3.14159265358979323846264338327950288419716939937510;
    double DEGRAD = PI / 180.0;
    LamcParameter map = LamcParameter(
      re: 6371.00877,
      grid: 5.0,
      slat1: 30.0,
      slat2: 60.0,
      olon: 126.0,
      olat: 38.0,
      xo: 210 / 5.0,
      yo: 675 / 5.0,
      first: 0,
    );

    double re, olon, olat, sn, sf, ro;

    double slat1, slat2, ra, theta;
    re = map.re / map.grid;
    slat1 = map.slat1 * DEGRAD;
    slat2 = map.slat2 * DEGRAD;
    olon = map.olon * DEGRAD;
    olat = map.olat * DEGRAD;

    sn = tan(PI * 0.25 + slat2 * 0.5) / tan(PI * 0.25 + slat1 * 0.5);
    sn = log(cos(slat1) / cos(slat2)) / log(sn);
    sf = tan(PI * 0.25 + slat1 * 0.5);
    sf = pow(sf, sn) * cos(slat1) / sn;
    ro = tan(PI * 0.25 + olat * 0.5);
    ro = re * sf / pow(ro, sn);
    map.first = 1;

    ra = tan(PI * 0.25 + lat * DEGRAD * 0.5);
    ra = re * sf / pow(ra, sn);
    theta = lon * DEGRAD - olon;

    if (theta > PI) theta -= 2.0 * PI;
    if (theta < -PI) theta += 2.0 * PI;

    theta *= sn;

    double x = (ra * sin(theta) + map.xo);
    double y = (ro - ra * cos(theta) + map.yo);

    int gridX = (x + 1.5).toInt();
    int gridY = (y + 1.5).toInt();

    return GridPosition(x: gridX, y: gridY);
  }
}
