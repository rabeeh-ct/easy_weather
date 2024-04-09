import 'package:easy_weather/di/di.dart';
import 'package:easy_weather/domain/entities/geocode_entity.dart';
import 'package:easy_weather/domain/params/no_params.dart';
import 'package:easy_weather/utils/debug_utils.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/weather_entity.dart';
import '../../../domain/usecases/get_current_weather_usecase.dart';
import '../../../domain/usecases/location_lat_lng_usecase.dart';



class HomeScreenController extends ChangeNotifier {
  // final baseUrl="http://api.weatherapi.com/v1/current.json?key=0f63a867f1e648e7ac1170736240804";
  late WeatherEntity weather;

  // late AdditionalWeatherData additionalWeatherData;
  LatLng? currentLocation;

  // List<HourlyWeather> hourlyWeather = [];
  // List<DailyWeather> dailyWeather = [];
  bool isLoading = false;
  bool isRequestError = false;
  bool isSearchError = false;
  bool isLocationserviceEnabled = false;
  LocationPermission? locationPermission;
  bool isCelsius = true;

  String get measurementUnit => isCelsius ? '°C' : '°F';

  Future<Position?> requestLocation(BuildContext context) async {
    isLocationserviceEnabled = await Geolocator.isLocationServiceEnabled();
    notifyListeners();

    if (!isLocationserviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location service disabled')),
      );
      return Future.error('Location services are disabled.');
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      isLoading = false;
      notifyListeners();
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Permission denied'),
        ));
        return Future.error('Location permissions are denied');
      }
    }

    if (locationPermission == LocationPermission.deniedForever) {
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Location permissions are permanently denied, Please enable manually from app settings',
        ),
      ));
      return Future.error('Location permissions are permanently denied');
    }

    consoleLog(">>>>>>>>>>>>1");
    return await Geolocator.getCurrentPosition();
  }

  final _locationLatLngUseCase = getIt.get<LocationLatLngUseCase>();

  Future<GeocodeEntity?> locToLatLng(String location, BuildContext context) async {
    GeocodeEntity? geocodeEntity;
    final queryParams = LocationLatLngQueryParams(
      q: location,
    );
    final response = await _locationLatLngUseCase(const NoParams(),
        queryParameters: queryParams.toJson());
    await response.fold((l) {
      consoleLog("error ${l.errorMessage()}");
      isRequestError = true;
      notifyListeners();
      appError = l;
      return l.handleError(context: context);
    }, (r) async {
      geocodeEntity=r;
      // if (r.status == 1) {
      //   //data = r.data;
      // } else {
      //   bool isArabic = Get.locale?.languageCode == "ar";
      //   showMessage(isArabic ? r.messageAr : r.messageEn);
      // }
    });
    return geocodeEntity;
  }

  Future<void> searchWeather(String location, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    isRequestError = false;
    consoleLog('search');
    try {
      GeocodeEntity? geocodeEntity;
      geocodeEntity = await locToLatLng(location,context);
      if (geocodeEntity == null) throw Exception('Unable to Find Location');
      await getData(context, latLng: geocodeEntity.latLng, isLoad: true);
      // await getCurrentWeather(geocodeEntity.latLng);
      weather.city = geocodeEntity.name;
    } catch (e) {
      consoleLog(e);
      isSearchError = true;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void switchTempUnit() {
    isCelsius = !isCelsius;
    notifyListeners();
  }

  AppError? appError;

  final _getCurrentWeatherUseCase = getIt.get<GetCurrentWeatherUseCase>();

  getData(BuildContext context, {bool isLoad = false, LatLng? latLng}) async {
    isLoading = true;
    isRequestError = false;
    isSearchError = false;
    if (isLoad) {
      notifyListeners();
    }
    Position? locData;
    if (latLng == null) {
      locData = await requestLocation(context);
      if (locData == null) {
        isLoading = false;
        notifyListeners();
        return;
      }
    }

    currentLocation = LatLng(latLng?.latitude ?? locData!.latitude,
        latLng?.longitude ?? locData!.longitude);
    appError = null;
    CurrentWeatherQueryParams currentWeatherQueryParams =
        CurrentWeatherQueryParams(
      lat: currentLocation!.latitude.toString(),
      lon: currentLocation!.longitude.toString(),
    );
    final response = await _getCurrentWeatherUseCase(const NoParams(),
        queryParameters: currentWeatherQueryParams.toJson());
    response.fold((l) {
      consoleLog("error ${l.errorMessage()}");
      isRequestError = true;
      notifyListeners();
      appError = l;
      return l.handleError(context: context);
    }, (r) async {
      weather = r;
      // if (r.status == 1) {
      //   //data = r.data;
      // } else {
      //   bool isArabic = Get.locale?.languageCode == "ar";
      //   showMessage(isArabic ? r.messageAr : r.messageEn);
      // }
    });
    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
