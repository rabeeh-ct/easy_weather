// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:uni_links/uni_links.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../../utils/debug_utils.dart';
// import '../presentation/routes/route_constants.dart';
//
// Future<String?> initUniLinks(BuildContext? context) async {
//   final link = await getInitialLink();
//   if (link == null) {
//     return null;
//   } else {
//     consoleLog(link);
//     await handleLinks(link);
//     return link;
//   }
// }
//
// handleLinks(String link, {bool isExternal = false}) {
//   consoleLog("link == $link");
//   var i = link.split('/');
//   String type = "";
//   try {
//     type = i[i.length - 2];
//   } catch (e) {
//     type = "";
//     consoleLog("catch $type");
//   }
//   var id = i.last;
//   consoleLog("type = $type");
//   if (type == "store") {
//     // Get.to(() => const StoreDetailsScreen(), arguments: id);
//     Get.toNamed(RouteList.storeDetailsScreen, arguments: id);
//     Get.find<StoreDetailsScreenController>().getData();
//   } else if (type == "product") {
//     // var i = link.split('/');
//     // var id = i[3].split('=');
//     // Get.toNamed(RouteList.productListScreen,arguments: ProductListArguments(offerSlug: id[1]));
//   } else {
//     consoleLog("handle link in else condition");
//     if (isExternal) {
//       if (link.contains("http")) {
//         try {
//           launchUrl(
//             Uri.parse(link),
//             mode: LaunchMode.externalApplication,
//           );
//         } catch (e) {}
//       } else {
//         try {
//           launchUrl(
//             Uri.https(link),
//             mode: LaunchMode.externalApplication,
//           );
//         } catch (e) {}
//       }
//     }
//   }
// }
