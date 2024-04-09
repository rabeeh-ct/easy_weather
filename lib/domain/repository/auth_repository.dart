// import 'package:dartz/dartz.dart';
// import 'package:doob/domain/entities/app_error.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import '../entities/response_entities/login_response_entity.dart';
// import '../entities/user_entity.dart';
//
// abstract class AuthenticationRepository {
//   Future<Either<AppError, LoginResponseEntity>> login(Map<String, dynamic> params);
//
//   Future<Either<AppError, Map<String, dynamic>>> register(
//       Map<String, dynamic> params);
//
//
//   Future<Either<AppError, LoginResponseEntity>> emailVerification(
//       Map<String, dynamic> params);
//   Future<Either<AppError, LoginResponseEntity>> forgotPasswordVerifyOtp(
//       Map<String, dynamic> params);
//
//   Future<Either<AppError, Map<String, dynamic>>> resendEmail(
//       Map<String, dynamic> params);
//
//   Future<Either<AppError, Map<String, dynamic>>> forgotPassword(
//       Map<String, dynamic> params);
//
//   Future<Either<AppError, Map<String, dynamic>>> forgotPasswordSendOtp(
//       Map<String, dynamic> params);
//
//   // Future<Either<AppError, Map<String, dynamic>>> socialSignIn(
//   //     Map<String, dynamic> params);
//
//   Future<Either<AppError, UserEntity?>> getUserLocal();
//
//   Future<Either<AppError, void>> deleteUserLocal();
//   Future<Either<AppError, void>> saveUserLocal(UserEntity params);
//   Future<Either<AppError, LoginResponseEntity>> socialSignIn(
//       Map<String, dynamic> params);
//   Future<Either<AppError, LoginResponseEntity>> socialRegister(
//       Map<String, dynamic> params);
//
//   Future<Either<AppError, User?>> googleSignIn();
//   Future<Either<AppError, User?>> facebookSignIn();
//
//   Future<Either<AppError, Map<String,dynamic>>> logout(Map<String, dynamic> params);
// // Future<Either<AppError, Map<String, dynamic>>> emailVerification(
// //     Map<String, dynamic> params);
// }
