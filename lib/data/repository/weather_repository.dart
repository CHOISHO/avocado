import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xml2json/xml2json.dart';

import 'package:avocado/utils/date.dart';

part 'weather_repository.g.dart'; // 자동 생성될 파일

final transformer = Xml2Json();

@riverpod
class WeatherRepository extends _$WeatherRepository {
  @override
  Future<dynamic> build() async {
    return await getWeather();
  }

  Future getWeather() async {
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
        'nx': '58',
        'ny': '126',
      },
    );

    var response = await http.get(url);

    transformer.parse(response.body);
    return transformer.toParker();
  }
}
