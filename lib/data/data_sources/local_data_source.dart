// import 'package:get_storage/get_storage.dart';
//
// import '../models/location_model.dart';
// import '../models/theme_model.dart';
// import '../../utils/debug_utils.dart';
//
// abstract class LocalDataSource {
//   Future<void> themeModeSave(Map<String, dynamic> params);
//
//   Future<ThemeModel?> getThemeMode();
//   Future<void> saveLocationLocal(Map<String, dynamic> params);
//   Future<LocationModel?> getLocationLocal();
// }
//
// class LocalDataSourceImpl implements LocalDataSource {
//   final box = GetStorage();
//
//   @override
//   Future<void> themeModeSave(Map<String, dynamic> params) async {
//     return await box.write("themeMode", params);
//   }
//
//   @override
//   Future<ThemeModel?> getThemeMode() async {
//     Map<String, dynamic>? map = box.read("themeMode");
//     consoleLog("map $map");
//     if (map != null) {
//       return ThemeModel.fromMap(map);
//     }
//     return null;
//   }
//
//   @override
//   Future<void> saveLocationLocal(Map<String, dynamic> params) async{
//     return await box.write("location", params);
//   }
//
//   @override
//   Future<LocationModel?> getLocationLocal() async {
//     Map<String, dynamic>? map = box.read("location");
//     if (map != null) {
//       return LocationModel.fromMap(map);
//     }
//     return null;
//   }
// }
