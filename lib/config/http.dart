import 'dart:convert';

import 'package:finds/config/logger_config.dart';
import 'package:finds/config/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NetworHandler {
  // String baseUrl = 'http://localhost:3030';
  String prodBaseUrl = 'https://finds-bn.onrender.com';
  String baseUrl = 'https://finds-bn-pr-3.onrender.com';

  Future get(String url) async {
    String? token = await getToken();
    url = formater(url);

    var response = await http.get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      AppLogger.logInfo(response.body);
    }
    return response.body;
  }

  Future post(String url, Map<String, dynamic> body) async {
    String? token = await getToken();
    try {
      url = formater(url);
      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: json.encode(body),
      );
      AppLogger.logInfo(response.body);
      return response;
    } catch (e) {
      AppLogger.logError(e.toString());
      return e;
    }
  }

  String formater(String url) {
    return baseUrl + url;
  }
}
