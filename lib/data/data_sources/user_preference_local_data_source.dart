// import 'dart:ui';
//
// import 'package:get_storage/get_storage.dart';
//
// abstract class UserPreferenceLocalDataSource {
//   Future<void> changeLocale(Locale locale);
// }
//
// class UserPreferenceLocalDataSourceImpl extends UserPreferenceLocalDataSource {
//   final box = GetStorage();
//   @override
//   changeLocale(Locale locale) async {
//     box.write("locale", locale.languageCode);
//   }
// }
