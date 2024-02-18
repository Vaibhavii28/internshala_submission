import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'URLConst.dart';

class APIManager {
  static Future<http.Response> fetchAPIResponse() async {
    try {
      String url = URLConst.url;

      http.Response response = await http.get(
        Uri.parse(url),
      );
      debugPrint("1-1-1-1 fetchResponseFromAPI Request ${response.request}");
      debugPrint(
          "1-1-1-1 fetchResponseFromAPI Status Code ${response.statusCode}");
      debugPrint("1-1-1-1 fetchResponseFromAPI Body ${response.body}");
      return response;
    } catch (e) {
      debugPrint("0-0-0-0 fetchResponseFromAPI ERROR ::: ${e.toString()}");
      return http.Response('error', 400);
    }
  }
}
