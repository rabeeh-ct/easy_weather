// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';

import '../di/di.dart';
import '../presentation/theme/theme.dart';
import 'firebase_messaging.dart';
import 'get_theme_mode.dart';

// late ThemeMode themeMode;

setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // getLostData();
  // setupNotification();
  DependencyInjection.init();
  setSystemOverlay();
  // await GetStorage.init();
  // themeMode = await getThemeMode();
  // await Firebase.initializeApp();

  // initUniLinks(Get.context);
}

// Future<void> getLostData() async {
//   final ImagePicker picker = ImagePicker();
//   final LostDataResponse response = await picker.retrieveLostData();
//   if (response.isEmpty) {
//     return;
//   }
//   final List<XFile>? files = response.files;
//   if (files != null) {
//     consoleLog("lost files is $files");
//   }
//     // _handleLostFiles(files);
//    else {
//   consoleLog("error ${response.exception}");
//   }
// }