import 'dart:convert';

import 'package:http/http.dart' as http;

Map<String, String> baseHeaders = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};

class ApiUtil {
  static Future<Map<String, dynamic>> get(String url, String path,
      [Map<String, String>? queryParameters]) async {
    Uri uri = Uri.https(url, path, queryParameters);

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('${response.statusCode} ${response.body}');
    }
  }

  static Future<Map<String, dynamic>> post(String url, String path,
      [Map<String, String>? body]) async {
    Uri uri = Uri.https(url, path);

    http.Response response = await http.post(uri, body: body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('${response.statusCode} ${response.body}');
    }
  }
}
