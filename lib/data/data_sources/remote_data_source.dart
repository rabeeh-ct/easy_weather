import 'package:easy_weather/data/models/geocode_model.dart';
import 'package:easy_weather/data/models/weather_model.dart';

import '../../di/di.dart';
import '../../utils/debug_utils.dart';
import '../core/api_client.dart';
import '../core/api_constants.dart';

abstract class RemoteDataSource {
  // Future<AppVersionModel> appVersionCheck(Map<String, dynamic> params);

  Future<WeatherModel> getCurrentWeather(
      {Map<String, dynamic>? queryParameters});

  Future<GeocodeModel> locationToLatLng(
      {Map<String, dynamic>? queryParameters});

// Future<BookingManagementResponseModel> getMyBookings(
//     Map<String, dynamic> params, {Map<String, dynamic>? queryParameters});
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiClient _apiClient = getIt.get<ApiClient>();

  // final ApiClient _apiClient = Get.find();

  // @override
  // Future<AppVersionModel> appVersionCheck(Map<String, dynamic> params) async {
  //   final response =
  //       await _apiClient.post(ApiConstants.appVersion, params: params);
  //   return AppVersionModel.fromJson(response);
  // }

  // @override
  // Future<BookingManagementResponseModel> getMyBookings(Map<String, dynamic> params, {Map<String, dynamic>? queryParameters}) async {
  //   final response = await _apiClient
  //       .getWithTokenHeader(ApiConstants.myBookings, params: params,queryParameters: queryParameters);
  //   return BookingManagementResponseModel.fromJson(response);
  // }

  @override
  Future<WeatherModel> getCurrentWeather(
      {Map<String, dynamic>? queryParameters}) async {
    consoleLog(":::::::::::4");
    // dynamic response;
    // try{
    //   response=await _apiClient.get(ApiConstants.getCurrentWeather, params: null,queryParameters: queryParameters);
    // }catch(e){
    //   consoleLog(":::::::::::5");
    //   consoleLog(e);
    //   consoleLog(":::::::::::5.1");
    // }
    final response = await _apiClient.get(ApiConstants.getCurrentWeather,
        params: null, queryParameters: queryParameters);
    consoleLog(":::::::::::6");
    WeatherModel weatherModel;
    try {
      weatherModel = WeatherModel.fromJson(response);
    } catch (e) {
      throw Exception();
    }
    return weatherModel;
  }

  @override
  Future<GeocodeModel> locationToLatLng(
      {Map<String, dynamic>? queryParameters}) async {
    consoleLog(":::::::::::4");
    final response = await _apiClient.get(ApiConstants.locationToLatLng,
        params: null, queryParameters: queryParameters);
    consoleLog(":::::::::::6");
    GeocodeModel geocodeModel;
    try {
      geocodeModel = GeocodeModel.fromJson(response[0]);
    } catch (e) {
      consoleLog(e);
      throw Exception();
    }
    return geocodeModel;
  }
}
