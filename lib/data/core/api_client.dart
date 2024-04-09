import 'dart:convert';

import 'package:http/http.dart';

import '../../utils/debug_utils.dart';
import 'api_constants.dart';

class ApiClient {
  final Client _client = Client();

  dynamic post(String path, {Map<dynamic, dynamic>? params, Map<String, dynamic>? queryParameters}) async {
    consoleLog(getPath(path,queryParameters: queryParameters));
    consoleLog(jsonEncode(params));
    // consoleLog(params);

    final response = await _client.post(getPath(path,queryParameters: queryParameters),
        body: jsonEncode(params), headers: {'Content-Type': 'application/json'});
    consoleLog(response.body);
    // consoleLog(json.decode(utf8.decode(response.bodyBytes)));
    return json.decode(utf8.decode(response.bodyBytes));
  }

  dynamic get(String path, {Map<dynamic, dynamic>? params,
    Map<String, dynamic>? queryParameters}) async {
    consoleLog(getPath(path,queryParameters: queryParameters));
    consoleLog(jsonEncode(params));
    // consoleLog(params);

    final response = await _client.get(getPath(path,queryParameters: queryParameters),
        headers: {'Content-Type': 'application/json'});
    consoleLog(response.body);
    consoleLog(response.statusCode);
    if(response.statusCode==401){
      throw Exception();
    }
    // consoleLog(json.decode(utf8.decode(response.bodyBytes)));
    return json.decode(utf8.decode(response.bodyBytes));
  }
}

Uri getPath(String path, {Map<String, dynamic>? queryParameters}) {
  // consoleLog("working query parameter $queryParameters");
  return Uri.https(ApiConstants.baseUrls,path,queryParameters);
}
