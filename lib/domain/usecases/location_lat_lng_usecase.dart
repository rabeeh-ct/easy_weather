import 'package:dartz/dartz.dart';
import 'package:easy_weather/di/di.dart';
import 'package:easy_weather/domain/entities/geocode_entity.dart';
import 'package:easy_weather/domain/params/no_params.dart';
import 'package:easy_weather/utils/debug_utils.dart';
import '../../common/constants.dart';
import '/domain/entities/app_error.dart';
import '/domain/usecases/usecase.dart';

import '../repository/data_repository.dart';

class LocationLatLngUseCase extends UseCase<GeocodeEntity, NoParams> {
  final DataRepository dataRepository = getIt.get<DataRepository>();

  @override
  Future<Either<AppError, GeocodeEntity>> call(NoParams params, {Map<String, dynamic>? queryParameters}) async {
    consoleLog(":::::::::::1");
    return await dataRepository.locationToLatLng(queryParameters: queryParameters);
  }
}

class LocationLatLngQueryParams {
  final String q;
  final String limit;
  final String appid;

  LocationLatLngQueryParams({
    required this.q,
    this.limit="5",
    this.appid=apiKey,
  });

  Map<String, dynamic> toJson() => {
    "q": q,
    "limit": limit,
    "appid": appid,
  };
}