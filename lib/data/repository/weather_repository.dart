import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:logger/web.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xml2json/xml2json.dart';

import 'package:avocado/data/repository/user_repository.dart';
import 'package:avocado/domain/mapper/weather_data_mapper.dart';
import 'package:avocado/domain/model/weather_model.dart';
import 'package:avocado/util/api.dart';
import 'package:avocado/util/date.dart';
import 'package:avocado/util/location.dart';

part 'weather_repository.g.dart'; // 자동 생성될 파일

final transformer = Xml2Json();

@riverpod
class WeatherRepository extends _$WeatherRepository {
  final String _url = 'apis.data.go.kr';
  final String _versoin = '/1360000/VilageFcstInfoService_2.0';
  final String _urlFirebase = 'bioni-avocado.firebaseapp.com';

  @override
  void build() {}

  Future<Weather?> get([String? address]) async {
    try {
      Location? location;

      if (address == null) {
        location = await LocationUtil().getLocation();
      } else {
        location = await LocationUtil().getLocationFromAddress(address);
      }

      if (location == null) {
        throw 'Location 정보가 없습니다.';
      }

      var userState = ref.watch(userRepositoryProvider);

      var response = await ApiUtil.post(
        url: _urlFirebase,
        path: '/weather/read',
        body: {
          'location': {
            'x': location.x,
            'y': location.y,
          }
        },
        token: userState.idToken,
      );

      var weather = Weather.fromJson(response['weather']).copyWith(
        district: location.district,
      );

      return weather;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  Future<Weather?> getUltraShortTermLive() async {
    try {
      Location? location = await LocationUtil().getLocation();

      if (location == null) {
        throw 'Location 정보가 없습니다.';
      }

      Map<String, dynamic> response = await ApiUtil.get(
        url: _url,
        path: '$_versoin/getUltraSrtNcst',
        queryParameters: {
          'serviceKey': dotenv.env['WEATHER_API_SERVICE_KEY']!,
          'pageNo': '1',
          'numOfRows': '1000',
          'dataType': 'JSON',
          'base_date': DateUtil.getYYYYMMDD(DateTime.now()),
          'base_time':
              DateUtil.getUltraShortTermForecastBaseTime(DateTime.now()),
          'nx': location.x.toString(),
          'ny': location.y.toString(),
        },
      );

      Weather weather = const Weather();

      switch (response['response']['header']['resultCode']) {
        case '00':
          weather = getUltraShortTermForecastMapper(response);
          break;
        case '03':
          throw '데이터가 없습니다.';
      }

      return weather.copyWith(district: location.district);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  Future<Weather?> getUltraShortTermForecast([String? address]) async {
    try {
      Location? location;

      if (address == null) {
        location = await LocationUtil().getLocation();
      } else {
        location = await LocationUtil().getLocationFromAddress(address);
      }

      if (location == null) {
        throw 'Location 정보가 없습니다.';
      }

      Map<String, dynamic> response = await ApiUtil.get(
        url: _url,
        path: '$_versoin/getUltraSrtFcst',
        queryParameters: {
          'serviceKey': dotenv.env['WEATHER_API_SERVICE_KEY']!,
          'pageNo': '1',
          'numOfRows': '1000',
          'dataType': 'JSON',
          'base_date':
              DateUtil.getUltraShortTermForecastBaseDate(DateTime.now()),
          'base_time':
              DateUtil.getUltraShortTermForecastBaseTime(DateTime.now()),
          'nx': location.x.toString(),
          'ny': location.y.toString(),
        },
      );

      Weather weather = const Weather();

      switch (response['response']['header']['resultCode']) {
        case '00':
          weather = getUltraShortTermForecastMapper(response);
          break;
        case '03':
          throw '데이터가 없습니다.';
      }

      return weather.copyWith(district: location.district);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  Future<Weather?> getShortTermForecast() async {
    try {
      Location? location = await LocationUtil().getLocation();

      if (location == null) {
        throw 'Location 정보가 없습니다.';
      }

      Map<String, dynamic> response = await ApiUtil.get(
        url: _url,
        path: '$_versoin/getVilageFcst',
        queryParameters: {
          'serviceKey': dotenv.env['WEATHER_API_SERVICE_KEY']!,
          'pageNo': '1',
          'numOfRows': '30',
          'dataType': 'JSON',
          'base_date': DateUtil.getShortTermForecastBaseDate(DateTime.now()),
          'base_time': DateUtil.getShortTermForecastBaseTime(DateTime.now()),
          'nx': location.x.toString(),
          'ny': location.y.toString(),
        },
      );

      Weather weather = const Weather();

      switch (response['response']['header']['resultCode']) {
        case '00':
          //TODO: getShortTermForecast Mapper 작성
          weather = getUltraShortTermForecastMapper(response);
          break;
        case '03':
          throw '데이터가 없습니다.';
      }

      return weather.copyWith(district: location.district);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }
}
