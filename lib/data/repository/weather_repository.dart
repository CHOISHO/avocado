import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:logger/web.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xml2json/xml2json.dart';

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

  @override
  void build() {}

  Future<Weather?> getUltraShortTermLive() async {
    try {
      Location? location = await LocationUtil().getLocation();

      if (location == null) {
        throw 'Location 정보가 없습니다.';
      }

      Map<String, dynamic> response = await ApiUtil.get(
        _url,
        '$_versoin/getUltraSrtNcst',
        {
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

  Future<Weather?> getUltraShortTermForecast() async {
    try {
      Location? location = await LocationUtil().getLocation();

      if (location == null) {
        throw 'Location 정보가 없습니다.';
      }

      Map<String, dynamic> response = await ApiUtil.get(
        _url,
        '$_versoin/getUltraSrtFcst',
        {
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
        _url,
        '$_versoin/getVilageFcst',
        {
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
