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
  late WeatherEntity weather;

  LatLng? currentLocation;

  bool isLoading = false;
  bool isRequestError = false;
  bool isSearchError = false;
  bool isLocationserviceEnabled = false;
  late LocationPermission locationPermission;
  bool isCelsius = true;
  String get measurementUnit => isCelsius ? '°C' : '°F';
  late LocationPermission permission;

  // for requesting the location, used Geolocator package
  Future<Position?> requestLocation(BuildContext context) async {
    isLoading = true;
    isLocationserviceEnabled = await Geolocator.isLocationServiceEnabled();
    notifyListeners();
    consoleLog("isLocationserviceEnabled = $isLocationserviceEnabled");
    locationPermission = await Geolocator.requestPermission();
    consoleLog("locationPermission = $locationPermission");

    switch (locationPermission) {
      case LocationPermission.deniedForever ||
            LocationPermission.unableToDetermine:
        isLoading = false;
        notifyListeners();
        return null;
      case LocationPermission.denied:
        consoleLog("locationPermission is denied >>>>>>>>");
        // try
        try {
          locationPermission = await Geolocator.requestPermission();
        } catch (e) {
          consoleLog("error");
        }
        consoleLog(">>>>>>>>>>> $locationPermission");
        isLoading = false;
        notifyListeners();
        requestLocation(context);
        break;
      case LocationPermission.whileInUse || LocationPermission.always:
        Position position = await Geolocator.getCurrentPosition();
        isLocationserviceEnabled = await Geolocator.isLocationServiceEnabled();
        notifyListeners();
        return position;
    }
    return null;
  }

  final _locationLatLngUseCase = getIt.get<LocationLatLngUseCase>();

  // location String convert to GeocodeEntity
  Future<GeocodeEntity?> locToLatLng(
      String location, BuildContext context) async {
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
      geocodeEntity = r;
    });
    return geocodeEntity;
  }

  // city search function
  Future<void> searchWeather(String location, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    isRequestError = false;
    consoleLog('search');
    try {
      GeocodeEntity? geocodeEntity;
      geocodeEntity = await locToLatLng(location, context);
      if (geocodeEntity == null) throw Exception('Unable to Find Location');
      await getData(context, latLng: geocodeEntity.latLng, isLoad: true);
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

  // first running function fot getting data
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
      // api error handling
      consoleLog("error ${l.errorMessage()}");
      isRequestError = true;
      notifyListeners();
      appError = l;
      return l.handleError(context: context);
    }, (r) async {
      // success data from api
      weather = r;
    });
    isLoading = false;
    notifyListeners();
  }
}
