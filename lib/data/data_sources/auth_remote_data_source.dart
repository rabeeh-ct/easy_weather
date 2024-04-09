// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
//
// import '../core/api_client.dart';
// import '../core/api_constants.dart';
// import '../core/social_authentication.dart';
// import '../models/response_model/login_response_model.dart';
//
// abstract class AuthenticationRemoteDataSource {
//   Future<LoginResponseModel> login(Map<String, dynamic> params);
//
//   Future<Map<String, dynamic>> logout(Map<String, dynamic> params);
//
//   Future<Map<String, dynamic>> register(Map<String, dynamic> params);
//
//   Future<LoginResponseModel> emailVerification(Map<String, dynamic> params);
//
//   Future<LoginResponseModel> forgotPasswordVerifyOtp(
//       Map<String, dynamic> params);
//
//   Future<Map<String, dynamic>> resendEmail(Map<String, dynamic> params);
//
//   Future<Map<String, dynamic>> forgotPasswordSendOtp(
//       Map<String, dynamic> params);
//
//   Future<Map<String, dynamic>> forgotPassword(Map<String, dynamic> params);
//
//   Future<LoginResponseModel> socialSignIn(Map<String, dynamic> params);
//
//   Future<LoginResponseModel> socialRegister(Map<String, dynamic> params);
//
//   Future<User?> googleSignIn();
//
//   Future<User?> facebookSignIn();
// }
//
// class AuthenticationRemoteDataSourceImpl
//     implements AuthenticationRemoteDataSource {
//   final ApiClient _apiClient = Get.find();
//
//   @override
//   Future<LoginResponseModel> login(Map<String, dynamic> params) async {
//     final response = await _apiClient.post(ApiConstants.login, params: params);
//     return LoginResponseModel.fromJson(response);
//   }
//
//   @override
//   Future<Map<String, dynamic>> register(Map<String, dynamic> params) async {
//     final response =
//         await _apiClient.post(ApiConstants.register, params: params);
//     return response;
//   }
//
//   @override
//   Future<LoginResponseModel> emailVerification(
//       Map<String, dynamic> params) async {
//     final response =
//         await _apiClient.post(ApiConstants.emailVerification, params: params);
//     return LoginResponseModel.fromJson(response);
//   }
//
//   @override
//   Future<Map<String, dynamic>> resendEmail(Map<String, dynamic> params) async {
//     final response =
//         await _apiClient.post(ApiConstants.resendEmail, params: params);
//     return response;
//   }
//
//   @override
//   Future<Map<String, dynamic>> forgotPassword(
//       Map<String, dynamic> params) async {
//     // Map<String, dynamic> param = {
//     //   "password": params["password"],
//     //   "password2": params["password2"]
//     // };
//     final response = await _apiClient.postWithTokenHeader(
//       ApiConstants.forgotPassword,
//       params: params,
//     );
//     return response;
//   }
//
//   @override
//   Future<LoginResponseModel> socialSignIn(Map<String, dynamic> params) async {
//     final response =
//         await _apiClient.post(ApiConstants.socialSignIn, params: params);
//     return LoginResponseModel.fromJson(response);
//   }
//
//   @override
//   Future<Map<String, dynamic>> forgotPasswordSendOtp(
//       Map<String, dynamic> params) async {
//     final response = await _apiClient.post(ApiConstants.forgotPasswordSendOtp,
//         params: params);
//     return response;
//   }
//
//   @override
//   Future<User?> googleSignIn() async {
//     final response = await SocialAuthentication.signInWithGoogle();
//     return response;
//   }
//
//   @override
//   Future<LoginResponseModel> forgotPasswordVerifyOtp(
//       Map<String, dynamic> params) async {
//     final response = await _apiClient.post(ApiConstants.forgotPasswordVerifyOtp,
//         params: params);
//     return LoginResponseModel.fromJson(response);
//   }
//
//   @override
//   Future<User?> facebookSignIn() async {
//     final response = await SocialAuthentication.signInWithFaceBook();
//     return response;
//   }
//
//   @override
//   Future<Map<String, dynamic>> logout(Map<String, dynamic> params) async {
//     final response = await _apiClient.postWithTokenHeader(ApiConstants.logout,
//         params: params);
//     if (response["status"] == 1) {
//       await SocialAuthentication.socialLogout();
//     }
//     return response;
//   }
//
//   @override
//   Future<LoginResponseModel> socialRegister(Map<String, dynamic> params) async {
//     // final String token=params["token"];
//     final response =
//         await _apiClient.post(ApiConstants.socialRegister, params: params);
//     return LoginResponseModel.fromJson(response);
//   }
// }
