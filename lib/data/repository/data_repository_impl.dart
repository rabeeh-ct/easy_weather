import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:easy_weather/domain/entities/geocode_entity.dart';
import 'package:easy_weather/domain/entities/weather_entity.dart';

import '../../di/di.dart';
import '../../domain/entities/app_error.dart';
import '../../domain/repository/data_repository.dart';
import '../../utils/debug_utils.dart';
import '../data_sources/remote_data_source.dart';

class DataRepositoryImpl implements DataRepository {
  // RemoteDataSource remoteDataSource = Get.find();

  final RemoteDataSource remoteDataSource = getIt.get<RemoteDataSource>();


  @override
  Future<Either<AppError, WeatherEntity>> getCurrentWeather({
    Map<String, dynamic>? queryParameters}) async {
      try {

        consoleLog(":::::::::::2");
        final response = await remoteDataSource.getCurrentWeather(queryParameters: queryParameters);
        consoleLog(":::::::::::3");
        return Right(response);
      } on SocketException {
        return Left(AppError(AppErrorType.network));
      } on Exception {
        return Left(AppError(AppErrorType.api));
      }
    }

  @override
  Future<Either<AppError, GeocodeEntity>> locationToLatLng({Map<String, dynamic>? queryParameters}) async {
    try {

      consoleLog(":::::::::::2");
      final response = await remoteDataSource.locationToLatLng(queryParameters: queryParameters);
      consoleLog(":::::::::::3");
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
  // LocalDataSource localDataSource = Get.find();

  // @override
  // Future<Either<AppError, AppVersionEntity>> appVersionCheck(
  //     Map<String, dynamic> params) async {
  //   try {
  //     final response = await remoteDataSource.appVersionCheck(params);
  //     return Right(response);
  //   } on SocketException {
  //     return Left(AppError(AppErrorType.network));
  //   } on Exception {
  //     return Left(AppError(AppErrorType.api));
  //   }
  // }

}
