import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:logger/web.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xml2json/xml2json.dart';

import 'package:avocado/domain/mapper/ultra_short_term_live_mapper.dart';
import 'package:avocado/domain/model/weather_model.dart';
import 'package:avocado/utils/date.dart';
import 'package:avocado/utils/location.dart';

part 'weather_repository.g.dart'; // 자동 생성될 파일

final transformer = Xml2Json();

@riverpod
class WeatherRepository extends _$WeatherRepository {
  final String _url = 'apis.data.go.kr';
  final String _versoin = '/1360000/VilageFcstInfoService_2.0';

  @override
  Future<Weather?> build() async {
    //TODO: WeatherRepository 가 state 를 필요로 하는지 정리
    // return await getUltraShortTermLive();
  }

  Future<Weather?> getUltraShortTermLive() async {
    Location? location = await LocationUtil().getLocation();

    if (location == null) {
      return null;
    }

    Uri url = Uri.http(
      _url,
      '$_versoin/getUltraSrtNcst',
      {
        'serviceKey': dotenv.env['API_SERVICE_KEY'],
        'pageNo': '1',
        'numOfRows': '1000',
        'dataType': 'JSON',
        'base_date': DateUtil.getYYYYMMDDToday(),
        'base_time': '0600',
        'nx': location.x.toString(),
        'ny': location.y.toString(),
      },
    );

    var response = await http.get(url);

    Weather weather = getUltraShortTermLiveMapper(jsonDecode(response.body));

    return weather.copyWith(district: location.district);
  }

  Future<Weather?> getUltraShortTermForecast() async {
    Location? location = await LocationUtil().getLocation();
    if (location == null) {
      return null;
    }

    Uri url = Uri.http(
      _url,
      '$_versoin/getUltraSrtFcst',
      {
        'serviceKey': dotenv.env['API_SERVICE_KEY'],
        'pageNo': '1',
        'numOfRows': '1000',
        'dataType': 'JSON',
        'base_date': DateUtil.getYYYYMMDDToday(),
        'base_time': '0530',
        'nx': location.x.toString(),
        'ny': location.y.toString(),
      },
    );

    try {
      var response = await http.get(url);

      // TODO: API 별 Mapper 필요 체크
      Weather weather = getUltraShortTermForecastMapper(jsonDecode(response.body));

      return weather.copyWith(district: location.district);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  Future<Weather?> getShortTermForecast() async {
    Location? location = await LocationUtil().getLocation();
    if (location == null) {
      return null;
    }

    Uri url = Uri.http(
      _url,
      '$_versoin/getVilageFcst',
      {
        'serviceKey': dotenv.env['API_SERVICE_KEY'],
        'pageNo': '1',
        'numOfRows': '2',
        'dataType': 'JSON',
        'base_date': DateUtil.getYYYYMMDDToday(),
        'base_time': DateUtil.getBaseTime(),
        'nx': location.x.toString(),
        'ny': location.y.toString(),
      },
    );

    try {
      var response = await http.get(url);

      Logger().i(jsonDecode(response.body));
      // Weather weather = getUltraShortTermForecastMapper(jsonDecode(response.body));

      // return weather.copyWith(district: location.district);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }
}
