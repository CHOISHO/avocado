import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

Map<String, String> baseHeaders = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};

class ApiUtil {
  static Future<Map<String, dynamic>> get(String url) async {
    http.Response resp = await http.get(
      Uri.parse(url),
      headers: baseHeaders,
    );

    if (resp.statusCode == 200) {
      return json.decode(resp.body);
    } else {
      throw Exception(resp.body.toString());
    }
  }

  static Future<Map<String, dynamic>> post(
    String url,
    Map<String, dynamic> payload,
  ) async {
    http.Response resp = await http.post(
      Uri.parse(url),
      body: json.encode(payload),
      headers: baseHeaders,
    );
    if (resp.statusCode == 200) {
      return json.decode(resp.body);
    } else {
      throw Exception(resp.body.toString());
    }
  }
}
