import 'package:dartz/dartz.dart';
import 'package:easy_weather/di/di.dart';
import 'package:easy_weather/domain/entities/weather_entity.dart';
import 'package:easy_weather/domain/params/no_params.dart';
import 'package:easy_weather/utils/debug_utils.dart';
import '../../common/constants.dart';
import '/domain/entities/app_error.dart';
import '/domain/usecases/usecase.dart';

import '../repository/data_repository.dart';

class GetCurrentWeatherUseCase extends UseCase<WeatherEntity, NoParams> {
  final DataRepository dataRepository = getIt.get<DataRepository>();

  @override
  Future<Either<AppError, WeatherEntity>> call(NoParams params, {Map<String, dynamic>? queryParameters}) async {
    consoleLog(":::::::::::1");
    return await dataRepository.getCurrentWeather(queryParameters: queryParameters);
  }
}

class CurrentWeatherQueryParams {
  final String lat;
  final String lon;
  final String units;
  final String appid;

  CurrentWeatherQueryParams({
    required this.lat,
    required this.lon,
    this.units="metric",
    this.appid= apiKey,
  });

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
    "units": units,
    "appid": appid,
  };
}