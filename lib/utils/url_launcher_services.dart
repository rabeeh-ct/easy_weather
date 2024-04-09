// // ignore_for_file: deprecated_member_use
//
// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import 'debug_utils.dart';
//
// class UrlLauncherServices {
//   static callLauncher(String phone) async {
//     String url = "tel:$phone";
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//     await launch(url);
//   }
//
//   static emailLauncher(String mail) async {
//     String url = "mailto:$mail";
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   static locator({
//     required String lat,
//     required String long,
//   }) async {
//     String url = "https://www.google.com/maps?q=loc:$lat,$long";
//
//     final String encodedURl = Uri.encodeFull(url);
//
//     if (await canLaunch(encodedURl)) {
//       await launch(encodedURl);
//     } else {
//       consoleLog('Could not launch $encodedURl');
//       throw 'Could not launch $encodedURl';
//     }
//   }
//
//   static watsappLaucher(BuildContext context,
//       {required String phone, required String message}) async {
//     String url = '';
//     if (Platform.isAndroid) {
//       // add the [https]
//       url = "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
//
//     } else {
//       // add the [https]
//       url =
//           "https://api.whatsapp.com/send?phone=+91$phone=$message"; // new line
//     }
//
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   static Future<void> launchInBrowser(String url) async {
//     if (await canLaunch(url)) {
//       await launch(
//         url,
//         forceSafariVC: false,
//         forceWebView: false,
//         headers: <String, String>{'my_header_key': 'my_header_value'},
//       );
//     } else {
//       throw 'Could not launch';
//     }
//   }
//
//   static Future<void> launchInWebViewOrVC(String url) async {
//     if (await canLaunch(url)) {
//       await launch(
//         url,
//         forceSafariVC: true,
//         forceWebView: true,
//         headers: <String, String>{'my_header_key': 'my_header_value'},
//       );
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
