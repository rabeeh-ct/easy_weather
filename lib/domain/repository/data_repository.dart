import 'package:dartz/dartz.dart';
import 'package:easy_weather/domain/entities/geocode_entity.dart';
import 'package:easy_weather/domain/entities/weather_entity.dart';

import '../entities/app_error.dart';

abstract class DataRepository {

  Future<Either<AppError, WeatherEntity>> getCurrentWeather({
    Map<String, dynamic>? queryParameters});

  Future<Either<AppError, GeocodeEntity>> locationToLatLng({
    Map<String, dynamic>? queryParameters});

}
