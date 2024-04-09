import 'dart:convert';

import 'package:http/http.dart';

import '../../utils/debug_utils.dart';
import 'api_constants.dart';

class ApiClient {
  final Client _client = Client();

  dynamic post(String path, {Map<dynamic, dynamic>? params}) async {
    consoleLog(getPath(path));
    consoleLog(jsonEncode(params));
    // consoleLog(params);

    final response = await _client.post(getPath(path),
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

  dynamic postList(String path, List<Map<dynamic, dynamic>> params) async {
    consoleLog(getPath(path));
    consoleLog(params);
    // consoleLog(params);

    final response = await _client.post(getPath(path),
        body: jsonEncode(params), headers: {'Content-Type': 'application/json'});
    consoleLog(response.body);
    return json.decode(response.body);
  }

  dynamic postWithTokenHeader(
    String path, {
    required Map<dynamic, dynamic> params,
    Map<String, dynamic>? queryParameters
  }) async {
    final token = getToken(params);
    params.remove("token");
    consoleLog(getPath(path,queryParameters: queryParameters));
    consoleLog(jsonEncode(params));
    // consoleLog(params);

    final response = await _client.post(getPath(path,queryParameters: queryParameters),
        body: jsonEncode(params),
        headers: {'Content-Type': 'application/json', 'Authorization': 'Token $token'});
    consoleLog(response.body);
    // consoleLog(json.decode(utf8.decode(response.bodyBytes)));
    return json.decode(utf8.decode(response.bodyBytes));
  }

  dynamic getWithTokenHeader(
    String path, {
    required Map<dynamic, dynamic> params,
    Map<String, dynamic>? queryParameters
  }) async {
    final token = getToken(params);
    params.remove("token");
    //////////////////////////////////
    consoleLog(getPath(path,queryParameters: queryParameters));
    consoleLog(jsonEncode(params));
    // consoleLog(params);

    final response = await _client.get(getPath(path,queryParameters: queryParameters),
        headers: {'Content-Type': 'application/json', 'Authorization': 'Token $token'});
    consoleLog(response.body);
    var responseBody = json.decode(utf8.decode(response.bodyBytes));
    return responseBody;
  }

  dynamic deleteWithTokenHeader(
    String path, {
    required Map<dynamic, dynamic> params,
  }) async {
    final token = getToken(params);
    params.remove("token");
    consoleLog(getPath(path));
    consoleLog(jsonEncode(params));
    // consoleLog(params);

    final response = await _client.delete(getPath(path),
        body: jsonEncode(params),
        headers: {'Content-Type': 'application/json', 'Authorization': 'Token $token'});
    consoleLog(response.body);
    // consoleLog(json.decode(utf8.decode(response.bodyBytes)));
    return json.decode(utf8.decode(response.bodyBytes));
  }

  dynamic putWithTokenHeader(
    String path, {
    required Map<dynamic, dynamic> params,
  }) async {
    final token = getToken(params);
    params.remove("token");
    consoleLog(getPath(path));
    consoleLog(jsonEncode(params));
    // consoleLog(params);

    final response = await _client.put(getPath(path),
        body: jsonEncode(params),
        headers: {'Content-Type': 'application/json', 'Authorization': 'Token $token'});
    consoleLog(response.body);
    // consoleLog(json.decode(utf8.decode(response.bodyBytes)));
    return json.decode(utf8.decode(response.bodyBytes));
  }

  String getToken(Map<dynamic, dynamic> params) {
    final String token = params["token"];
    return token;
  }

  dynamic postFile(String path,
      {required Map<String, dynamic> params, required String imageField}) async {
    final token = getToken(params);
    params.remove("token");
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Token $token"
    };
    String? filePath = params[imageField];

    var request = MultipartRequest("post", getPath(path));

    consoleLog(getPath(path));
    consoleLog(jsonEncode(params));

    params.forEach((key, value) {
      if (key != imageField) {
        if (value != null) {
          request.fields[key] = value;
        }
      }
    });
    // request.fields.addAll(params);
    // params["caption"] != null
    //     ? request.fields['caption'] = params["caption"]
    //     : null;
    filePath != null
        ? request.files.add(
            await MultipartFile.fromPath(imageField, filePath),
          )
        : null;

    consoleLog("working>>>>>>>>>>>>>>>>>>> ${request.fields},  ${request.files}");
    // request.files.add(await MultipartFile.fromPath("image", filePath));
    request.headers.addAll(headers);
    final response = await request.send();
    consoleLog("statusCode >>>>>>>>>>>>>>>>>>> ${response.statusCode}");
    consoleLog("statusCode >>>>>>>>>>>>>>>>>>> ${response.reasonPhrase}");
    final responseStr = await response.stream.bytesToString();
    consoleLog("...${json.decode(responseStr)}");
    return json.decode(responseStr);
    // response.stream.transform(utf8.decoder).listen((value) {
    //   consoleLog(json.decode(value));
    //
    // });
  }
}

Uri getPath(String path, {Map<String, dynamic>? queryParameters}) {
  // consoleLog("working query parameter $queryParameters");
  return Uri.https(ApiConstants.baseUrls,path,queryParameters);
}
