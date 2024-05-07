import 'dart:convert';

import 'package:http/http.dart' as http;

Map<String, String> baseHeaders = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};

class ApiUtil {
  static Future<Map<String, dynamic>> get(String url, String path, [Map<String, String>? queryParameters]) async {
    Uri uri = Uri.http(url, path, queryParameters);

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.body.toString());
    }
  }
}
