import 'dart:math';

import 'package:geolocator/geolocator.dart';

class Location {
  int latitude;
  int longitude;
  int x;
  int y;
  Location({
    required this.latitude,
    required this.longitude,
    required this.x,
    required this.y,
  });
}

class LocationUtil {
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  Future<bool> _handlePermission() async {
    // Test if location services are enabled.
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permissionStatus = await _geolocatorPlatform.checkPermission();

    if (permissionStatus == LocationPermission.denied) {
      permissionStatus = await _geolocatorPlatform.requestPermission();
      if (permissionStatus == LocationPermission.denied) {
        return false;
      }
    }

    if (permissionStatus == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  Future<Location?> getCurrentPosition() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return null;
    }

    final position = await _geolocatorPlatform.getCurrentPosition();

    Map<String, int> result = mapConv(
      position.longitude,
      position.latitude,
      0,
      0,
      0,
      LamcParameter(
        re: 6371.00877,
        grid: 5.0,
        slat1: 30.0,
        slat2: 60.0,
        olon: 126.0,
        olat: 38.0,
        xo: 210 / 5.0,
        yo: 675 / 5.0,
        first: 0,
      ),
    );
    return Location(
      latitude: position.latitude.toInt(),
      longitude: position.longitude.toInt(),
      x: result['x']!,
      y: result['y']!,
    );
  }
}

class LamcParameter {
  double re; // 지구 반지름
  double grid; // 격자 크기
  double slat1; // 표준 위도 1
  double slat2; // 표준 위도 2
  double olon; // 중심 경도
  double olat; // 중심 위도
  double xo; // X축 이동
  double yo; // Y축 이동
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

Map<String, int> mapConv(double lon, double lat, double x, double y, int code, LamcParameter map) {
  double lon1, lat1;
  double x1 = 0, y1 = 0;

  if (code == 0) {
    lon1 = lon;
    lat1 = lat;
    Map<String, double> result = lamcProj(lon1, lat1, x1, y1, 0, map);

    x = (result['x']! + 1.5).toInt().toDouble();
    y = (result['y']! + 1.5).toInt().toDouble();
  }

  return {'x': x.toInt(), 'y': y.toInt()};
}

Map<String, double> lamcProj(double lon, double lat, double x, double y, int code, LamcParameter map) {
  const double PI = 3.14159265358979323846264338327950288419716939937510;
  const double DEGRAD = PI / 180.0;

  double re, olon, olat, sn, sf, ro;

  double slat1, slat2, alon, alat, xn, yn, ra, theta;
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

  if (code == 0) {
    ra = tan(PI * 0.25 + lat * DEGRAD * 0.5);
    ra = re * sf / pow(ra, sn);
    theta = lon * DEGRAD - olon;
    if (theta > PI) theta -= 2.0 * PI;
    if (theta < -PI) theta += 2.0 * PI;
    theta *= sn;
    x = (ra * sin(theta) + map.xo);
    y = (ro - ra * cos(theta) + map.yo);
  }

  return {'x': x, 'y': y};
}
