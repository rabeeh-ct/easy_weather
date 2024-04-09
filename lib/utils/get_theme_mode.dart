// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../domain/params/no_params.dart';
// import '../domain/usecases/get_theme_mode_usecase.dart';
// import 'debug_utils.dart';
//
// Future<ThemeMode> getThemeMode() async {
//   final GetThemeModeUseCase getThemeModeUseCase = Get.find();
//   final response = await getThemeModeUseCase(const NoParams());
//   ThemeMode? tm;
//   response.fold((l) => l.handleError(), (r) async {
//     if (r != null) {
//       consoleLog(r.themeMode);
//       tm = r.themeMode == 0
//           ? ThemeMode.system
//           : r.themeMode == 1
//               ? ThemeMode.light
//               : ThemeMode.dark;
//     }
//   });
//   return tm ?? ThemeMode.dark;
// }
