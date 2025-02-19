import 'dart:convert';
import 'package:crafty_bay/services/network_response.dart';
import 'package:crafty_bay/services/user_data_controller.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);

      Logger().d(url);
      Map<String,String> headers = {
        "Content-Type" : "application/json",
        "token" : UserDataController.accessToken.toString(),
      };

      Response response = await get(uri,headers: headers);

      final decodeBody = jsonDecode(response.body);

      _debugLoggerPrint(url, response);

      if ((response.statusCode == 200 || response.statusCode == 201) &&
          decodeBody['status'] == 'success') {
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: true,
            responseBody: decodeBody,
            successMessage: decodeBody['msg']);
      } else {
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: false,
            errorMessage: decodeBody['msg']);
      }
    } catch (e) {
      return NetworkResponse(
          statusCode: -1, isSuccess: false, errorMessage: e.toString());
    }
  }
  Future<NetworkResponse> postRequest(String url,Map<String,dynamic> body) async {
    try {
      Uri uri = Uri.parse(url);

      Logger().d(url);

      Map<String,String> headers = {
        "Content-Type" : "application/json",
        "token" : UserDataController.accessToken.toString(),
      };

      final encodeBody = jsonEncode(body);

      final Response response = await post(uri,body: encodeBody,headers: headers);

      final decodeBody = jsonDecode(response.body);

      _debugLoggerPrint(url, response);

      if ((response.statusCode == 200 || response.statusCode == 201) &&
          decodeBody['status'] == 'success') {
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: true,
            responseBody: decodeBody,
            successMessage: decodeBody['msg']);
      } else {
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: false,
            errorMessage: decodeBody['msg']);
      }
    } catch (e) {
      return NetworkResponse(
          statusCode: -1, isSuccess: false, errorMessage: e.toString());
    }
  }

  void _debugLoggerPrint(String url, Response response) {
    Logger().d(
        'URL => $url\n STATUS CODE => ${response.statusCode} \n HEADER => ${response.headers}\n BODY => ${response.body}');
  }
}
