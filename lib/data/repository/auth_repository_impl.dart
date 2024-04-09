// import 'dart:io';
//
// import 'package:dartz/dartz.dart';
// import 'package:doob/data/models/user_model.dart';
// import 'package:doob/domain/entities/app_error.dart';
// import 'package:doob/domain/entities/user_entity.dart';
// import 'package:doob/utils/debug_utils.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
//
// import '../../domain/entities/response_entities/login_response_entity.dart';
// import '../../domain/repository/auth_repository.dart';
// import '../data_sources/auth_local_data_source.dart';
// import '../data_sources/auth_remote_data_source.dart';
//
// class AuthenticationRepositoryImpl implements AuthenticationRepository {
//   final AuthenticationRemoteDataSource authenticationRemoteDataSource =
//       Get.find();
//   final AuthenticationLocalDataSource _authenticationLocalDataSource =
//       Get.find();
//
//   @override
//   Future<Either<AppError, LoginResponseEntity>> login(
//       Map<String, dynamic> params) async {
//     // consoleLog("data");
//     try {
//       final response = await authenticationRemoteDataSource.login(params);
//       // if (response.status == 1) {
//       //   // response.userModel
//       //   UserModel userModel = response.userModel!;
//       //   _authenticationLocalDataSource.saveUser(userModel);
//       // }
//       return Right(response);
//     } on UnauthorizedException {
//       return Left(AppError(AppErrorType.unauthorised));
//     } on SocketException {
//       return Left(AppError(AppErrorType.network));
//     } on Exception {
//       return Left(AppError(AppErrorType.api));
//     }
//   }
//
//   @override
//   Future<Either<AppError, Map<String, dynamic>>> register(
//       Map<String, dynamic> params) async {
//     try {
//       final response = await authenticationRemoteDataSource.register(params);
//       return Right(response);
//     } on UnauthorizedException {
//       return Left(AppError(AppErrorType.unauthorised));
//     } on SocketException {
//       return Left(AppError(AppErrorType.network));
//     } on Exception {
//       return Left(AppError(AppErrorType.api));
//     }
//   }
//
//   @override
//   Future<Either<AppError, LoginResponseEntity>> emailVerification(
//       Map<String, dynamic> params) async {
//     try {
//       final response =
//           await authenticationRemoteDataSource.emailVerification(params);
//       return Right(response);
//     } on UnauthorizedException {
//       return Left(AppError(AppErrorType.unauthorised));
//     } on SocketException {
//       return Left(AppError(AppErrorType.network));
//     } on Exception {
//       return Left(AppError(AppErrorType.api));
//     }
//   }
//
//   @override
//   Future<Either<AppError, Map<String, dynamic>>> forgotPassword(
//       Map<String, dynamic> params) async {
//     try {
//       final response =
//           await authenticationRemoteDataSource.forgotPassword(params);
//       return Right(response);
//     } on UnauthorizedException {
//       return Left(AppError(AppErrorType.unauthorised));
//     } on SocketException {
//       return Left(AppError(AppErrorType.network));
//     } on Exception {
//       return Left(AppError(AppErrorType.api));
//     }
//   }
//
//   @override
//   Future<Either<AppError, Map<String, dynamic>>> resendEmail(
//       Map<String, dynamic> params) async {
//     try {
//       final response = await authenticationRemoteDataSource.resendEmail(params);
//       return Right(response);
//     } on UnauthorizedException {
//       return Left(AppError(AppErrorType.unauthorised));
//     } on SocketException {
//       return Left(AppError(AppErrorType.network));
//     } on Exception {
//       return Left(AppError(AppErrorType.api));
//     }
//   }
//
//   @override
//   Future<Either<AppError, LoginResponseEntity>> socialSignIn(
//       Map<String, dynamic> params) async {
//     try {
//       final response =
//           await authenticationRemoteDataSource.socialSignIn(params);
//       // if (response.status == 1) {
//       //   UserModel userModel = response.userModel!;
//       //   _authenticationLocalDataSource.saveUser(userModel);
//       // }
//       return Right(response);
//     } on UnauthorizedException {
//       return Left(AppError(AppErrorType.unauthorised));
//     } on SocketException {
//       return Left(AppError(AppErrorType.network));
//     } on Exception {
//       return Left(AppError(AppErrorType.api));
//     }
//   }
//
//   @override
//   Future<Either<AppError, UserEntity?>> getUserLocal() async {
//     try {
//       final response = _authenticationLocalDataSource.getUser();
//       return Right(response);
//     } on UnauthorizedException {
//       return Left(AppError(AppErrorType.unauthorised));
//     } on SocketException {
//       return Left(AppError(AppErrorType.network));
//     } on Exception {
//       return Left(AppError(AppErrorType.api));
//     }
//   }
//
//   @override
//   Future<Either<AppError, User?>> googleSignIn() async {
//     try {
//       final response = await authenticationRemoteDataSource.googleSignIn();
//       return Right(response);
//     } on UnauthorizedException {
//       return Left(AppError(AppErrorType.unauthorised));
//     } on SocketException {
//       return Left(AppError(AppErrorType.network));
//     } on Exception {
//       return Left(AppError(AppErrorType.api));
//     }
//   }
//
//   @override
//   Future<Either<AppError, void>> deleteUserLocal() async {
//     try {
//       final response = _authenticationLocalDataSource.deleteUser();
//       return Right(response);
//     } on UnauthorizedException {
//       return Left(AppError(AppErrorType.unauthorised));
//     } on SocketException {
//       return Left(AppError(AppErrorType.network));
//     } on Exception {
//       return Left(AppError(AppErrorType.api));
//     }
//   }
//
//   @override
//   Future<Either<AppError, Map<String, dynamic>>> forgotPasswordSendOtp(
//       Map<String, dynamic> params) async {
//     try {
//       final response =
//           await authenticationRemoteDataSource.forgotPasswordSendOtp(params);
//       return Right(response);
//     } on UnauthorizedException {
//       return Left(AppError(AppErrorType.unauthorised));
//     } on SocketException {
//       return Left(AppError(AppErrorType.network));
//     } on Exception {
//       return Left(AppError(AppErrorType.api));
//     }
//   }
//
//   @override
//   Future<Either<AppError, LoginResponseEntity>> forgotPasswordVerifyOtp(
//       Map<String, dynamic> params) async {
//     try {
//       final response =
//           await authenticationRemoteDataSource.forgotPasswordVerifyOtp(params);
//       // if (response. 1) {
//       //   // response.userModel
//       //   UserModel userModel = UserModel.fromJson(response["data"]);
//       //   _authenticationLocalDataSource.saveUser(userModel);
//       // }
//       return Right(response);
//     } on UnauthorizedException {
//       return Left(AppError(AppErrorType.unauthorised));
//     } on SocketException {
//       return Left(AppError(AppErrorType.network));
//     } on Exception {
//       return Left(AppError(AppErrorType.api));
//     }
//   }
//
//   @override
//   Future<Either<AppError, User?>> facebookSignIn() async {
//     // consoleLog("data");
//     try {
//       final response = await authenticationRemoteDataSource.facebookSignIn();
//       consoleLog("data2");
//       return Right(response);
//     } on UnauthorizedException {
//       return Left(AppError(AppErrorType.unauthorised));
//     } on SocketException {
//       return Left(AppError(AppErrorType.network));
//     } on Exception {
//       return Left(AppError(AppErrorType.api));
//     }
//   }
//
//   @override
//   Future<Either<AppError, Map<String, dynamic>>> logout(
//       Map<String, dynamic> params) async {
//     // consoleLog("data");
//     try {
//       final response = await authenticationRemoteDataSource.logout(params);
//       return Right(response);
//     } on UnauthorizedException {
//       return Left(AppError(AppErrorType.unauthorised));
//     } on SocketException {
//       return Left(AppError(AppErrorType.network));
//     } on Exception {
//       return Left(AppError(AppErrorType.api));
//     }
//   }
//
//   @override
//   Future<Either<AppError, void>> saveUserLocal(UserEntity params) async {
//     try {
//       final response = _authenticationLocalDataSource.saveUser(UserModel(
//         name: params.name,
//         email: params.email,
//         token: params.token,
//         userId: params.userId,
//         imagePath: params.imagePath,
//       ));
//       return Right(response);
//     } on UnauthorizedException {
//       return Left(AppError(AppErrorType.unauthorised));
//     } on SocketException {
//       return Left(AppError(AppErrorType.network));
//     } on Exception {
//       return Left(AppError(AppErrorType.api));
//     }
//   }
//
//   @override
//   Future<Either<AppError, LoginResponseEntity>> socialRegister(
//       Map<String, dynamic> params) async {
//     try {
//       final response =
//           await authenticationRemoteDataSource.socialRegister(params);
//       return Right(response);
//     } on UnauthorizedException {
//       return Left(AppError(AppErrorType.unauthorised));
//     } on SocketException {
//       return Left(AppError(AppErrorType.network));
//     } on Exception {
//       return Left(AppError(AppErrorType.api));
//     }
//   }
// }
