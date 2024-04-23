import 'package:xml2json/xml2json.dart';

final transformer = Xml2Json();

class WeatherRepository {
  final String apiKey;
  final String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';

  WeatherRepository({required this.apiKey});
}
