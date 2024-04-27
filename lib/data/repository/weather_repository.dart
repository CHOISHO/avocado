import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xml2json/xml2json.dart';

import 'package:avocado/domain/model/district_model.dart';
import 'package:avocado/domain/model/weather_model.dart';
import 'package:avocado/utils/date.dart';
import 'package:avocado/utils/location.dart';

part 'weather_repository.g.dart'; // 자동 생성될 파일

final transformer = Xml2Json();

@riverpod
class WeatherRepository extends _$WeatherRepository {
  @override
  Future<Weather?> build() async {
    return await getUltraShortTermLive();
  }

  Future<Weather?> getUltraShortTermLive() async {
    Location? location = await LocationUtil().getLocation();

    if (location == null) {
      return null;
    }

    Uri url = Uri.http(
      'apis.data.go.kr',
      '/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst',
      {
        'serviceKey': dotenv.env['API_SERVICE_KEY'],
        'pageNo': '1',
        'numOfRows': '1000',
        'dataType': 'XML',
        'base_date': DateUtil.getYYYYMMDDToday(),
        'base_time': '0600',
        'nx': location.x.toString(),
        'ny': location.y.toString(),
      },
    );

    var response = await http.get(url);

    transformer.parse(response.body);
    return Weather(
        district: District(administrativeArea: 'city', subLocality: 'district', thoroughfare: 'street'),
        temperature: 0,
        precipitationProbability: 0,
        precipitation: 0,
        humidity: 0,
        baseTime: '0600');
  }

  Future getUltraShortTermForecast() async {
    Location? location = await LocationUtil().getLocation();
    if (location == null) {
      return;
    }

    Uri url = Uri.http(
      'apis.data.go.kr',
      '/1360000/VilageFcstInfoService_2.0/getUltraSrtFScst',
      {
        'serviceKey': dotenv.env['API_SERVICE_KEY'],
        'pageNo': '1',
        'numOfRows': '1000',
        'dataType': 'XML',
        'base_date': DateUtil.getYYYYMMDDToday(),
        'base_time': '0630',
        'nx': location.x.toString(),
        'ny': location.y.toString(),
      },
    );

    var response = await http.get(url);

    transformer.parse(response.body);
    return transformer.toParker();
  }
}
