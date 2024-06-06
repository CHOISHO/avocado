import 'dart:convert';

import 'package:http/http.dart' as http;

Map<String, String> baseHeaders = {
  'Content-Type': 'application/json',
};

class ApiUtil {
  static Future<Map<String, dynamic>> get(String url, String path,
      [Map<String, String>? queryParameters, String? token]) async {
    Uri uri = Uri.https(Uri.encodeComponent(url), path, queryParameters);

    http.Response response = await http.get(
      uri,
      headers: token != null
          ? baseHeaders
          : {...baseHeaders, 'Authorization': '$token'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('${response.statusCode} ${response.body}');
    }
  }

  static Future<Map<String, dynamic>> post({
    required String url,
    required String path,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    Uri uri = Uri.https(url, path);

    http.Response response = await http.post(
      uri,
      headers: token != null
          ? baseHeaders
          : {
              ...baseHeaders,
              'Authorization': '$token',
            },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('${response.statusCode} ${response.body}');
    }
  }
}
