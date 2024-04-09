// import 'dart:convert';
//
// import 'package:get_storage/get_storage.dart';
//
// import '../models/user_model.dart';
//
// abstract class AuthenticationLocalDataSource {
//   void saveUser(UserModel userModel);
//
//   void deleteUser();
//
//   UserModel? getUser();
// }
//
// class AuthenticationLocalDataSourceImpl
//     implements AuthenticationLocalDataSource {
//   final box = GetStorage();
//
//   @override
//   saveUser(UserModel userModel) {
//     box.write("user", jsonEncode(userModel.toJson()));
//   }
//
//   @override
//   deleteUser() {
//     box.remove("user");
//   }
//
//   @override
//   UserModel? getUser() {
//     String? jsonUser = box.read("user");
//     if (jsonUser != null) {
//       UserModel userModel = UserModel.fromJson(jsonDecode(jsonUser));
//       return userModel;
//     }
//     return null;
//   }
// }
