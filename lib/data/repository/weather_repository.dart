import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

final transformer = Xml2Json();

class WeatherRepository {
  static getData() async {
    Uri url = Uri.http(
      'apis.data.go.kr',
      '/1360000/VilageFcstInfoService_2.0/getVilageFcst',
      {
        'serviceKey': dotenv.env['API_SERVICE_KEY'],
        'pageNo': '1',
        'numOfRows': '1000',
        'dataType': 'XML',
        'base_date': '20240416',
        'base_time': '0500',
        'nx': '58',
        'ny': '126',
      },
    );

    var response = await http.get(url);

    transformer.parse(response.body);
  }
}
