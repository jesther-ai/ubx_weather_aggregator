import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:ubx_weather_aggregator/utilities/app_config.dart';
import 'package:http/http.dart' as http;
// enum RequestType { post, get }

class API {
  Future<Map<String, dynamic>> request({Map<String, dynamic>? parameter, required String query}) async {
    debugPrint('API REQUEST: $parameter');
    Map<String, String>? headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'appid': AppConfig.key,
      'q': query,
    };
    http.Response response;
    try {
      //============================================================

      response = await http
          .get(
            Uri.http(AppConfig.host, AppConfig.path, parameter),
            headers: headers,
          )
          .timeout(const Duration(seconds: 10));

      //============================================================
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        debugPrint('API RESPONSE (${(response.contentLength.toString())} Bytes): ${(response.body.toString())}');
        Map<String, dynamic> data = jsonDecode(response.body);

        data['needPopUpError'] = false;
        return data;
      } else {
        debugPrint(response.body);
        return jsonDecode(response.body);
      }
    } on TimeoutException catch (e) {
      debugPrint('Timeout Error: ${e.toString()}');
      return {
        'success': false,
        'needPopUpError': true,
        'message': 'Slow Internet Connection',
      };
    } on SocketException catch (e) {
      debugPrint('Socket Error: ${e.toString()}');
      return {
        'success': false,
        'needPopUpError': true,
        'message': 'No Internet Connection',
      };
    } on FormatException catch (e) {
      debugPrint('Format Error: ${e.toString()}');
      return {
        'success': false,
        'needPopUpError': true,
        'message': 'API Error: Contact Developer',
      };
    } on HttpException catch (e) {
      debugPrint('Format Error: ${e.toString()}');
      return {
        'success': false,
        'needPopUpError': true,
        'message': 'Disconnected from server',
      };
    }
  }
}
