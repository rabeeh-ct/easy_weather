// // ignore_for_file: depend_on_referenced_packages
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:get/get.dart';
//
// String? nameValidator(String? value) {
//   return value!.isEmpty
//       ? AppLocalizations.of(Get.context!)!.please_enter_your_name
//       : value.length < 3
//           ? AppLocalizations.of(Get.context!)!.please_enter_a_valid_name
//           : null;
// }
//
// String? requiredValidator(String? value) {
//   return value==null||value=="" ? AppLocalizations.of(Get.context!)!.this_field_required : null;
// }
//
// String? userNameValidator(String? value) {
//   String pattern = r"^[A-Za-z][A-Za-z0-9_]{4,29}$";
//   RegExp regExp = RegExp(pattern);
//   return value!.isEmpty
//       ? AppLocalizations.of(Get.context!)!.please_enter_your_username
//       : regExp.hasMatch(value.trim())
//           ? null
//           : AppLocalizations.of(Get.context!)!.please_enter_a_valid_username;
// }
//
// String? pinCodeValidator(String? value) {
//   return value!.isEmpty
//       ? "Please enter your pin"
//       : value.length != 6
//           ? "Please enter a valid pin"
//           : null;
// }
//
// String? phoneValidator({String? value, int size = 9}) {
//   return value!.isEmpty
//       ? AppLocalizations.of(Get.context!)!.please_enter_a_phone_number
//       // : value.length != size
//       //     ? AppLocalizations.of(Get.context!)!.please_enter_a_valid_phone_number
//       : null;
// }
//
// String? emailValidator(String? value) {
//   return value!.isEmpty
//       ? AppLocalizations.of(Get.context!)!.please_enter_your_email
//       : !value.trim().isEmail
//           ? AppLocalizations.of(Get.context!)!.please_enter_a_valid_email
//           : null;
// }
//
// String? passwordValidator(String? value, int size) {
//   String pattern = r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d].{7,}$';
//   // String pattern =
//   //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
//   // "password_validation" : "Password must contain\n - Eight length \n - A small case letter \n - A capital case letter \n - A number and Special Charecters",
//   RegExp regExp = RegExp(pattern);
//   return value!.isEmpty
//       ? AppLocalizations.of(Get.context!)!.please_enter_your_password
//       : value.length < size
//           ? AppLocalizations.of(Get.context!)!.password_validation
//           : regExp.hasMatch(value)
//               ? null
//               : AppLocalizations.of(Get.context!)!.password_validation;
// }
