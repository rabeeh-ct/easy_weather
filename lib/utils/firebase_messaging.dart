// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
//
// import '../presentation/routes/route_constants.dart';
// import '../presentation/theme/theme.dart';
// import 'debug_utils.dart';
//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   consoleLog(">>>>>>>>>>>>>> _firebaseMessagingBackgroundHandler <<<<<<<<<<<<<<<");
//   try {
//     await Firebase.initializeApp();
//     // await Future.delayed(const Duration(seconds: 6));
//     handlePayload(message.data["link"]);
//   } catch (e) {
//     consoleLog("<<<<<< background exception >>>>>>>>");
//   }
// }
//
// void onDidReceiveBackgroundNotificationResponse(NotificationResponse response) async {
//   try {
//     await Firebase.initializeApp();
//     consoleLog("data9077");
//     // await Future.delayed(const Duration(seconds: 6));
//     handlePayload(response.payload);
//   } catch (e) {
//     consoleLog("<<<<<< local background exception >>>>>>>>");
//   }
// }
//
// void onDidReceiveNotificationResponse(NotificationResponse response) {
//   try {
//     consoleLog("data907712");
//     consoleLog(">>>>>>>>>${response.payload}");
//     handlePayload(response.payload);
//   } catch (e) {
//     consoleLog("<<<<<< local receive exception >>>>>>>>");
//   }
// }
//
// AndroidNotificationChannel channel = const AndroidNotificationChannel(
//     'high_importance_channel', 'High Importance Notifications',
//     description: 'This channel is used for importance notifications.',
//     importance: Importance.high,
//     playSound: true,
//     enableVibration: true,
//     showBadge: true);
//
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
//
// FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
//
// setupNotification() async {
//   await firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: true,
//       criticalAlert: true,
//       provisional: true,
//       sound: true);
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//
//   // final AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('ic_launcher');
//   var initializationSettingsAndroid =
//       const AndroidInitializationSettings('@drawable/ic_stat_doob_logo');
//   var initializationSettingsIOs = const DarwinInitializationSettings();
//   var initSettings = InitializationSettings(
//       android: initializationSettingsAndroid, iOS: initializationSettingsIOs);
//   flutterLocalNotificationsPlugin.initialize(initSettings,
//       onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
//       onDidReceiveBackgroundNotificationResponse: onDidReceiveBackgroundNotificationResponse);
//   // flutterLocalNotificationsPlugin.initialize();
//
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);
//
//   await firebaseMessaging.setForegroundNotificationPresentationOptions(
//       alert: true, badge: true, sound: true);
//
//   firebaseMessaging.getInitialMessage().then((RemoteMessage? message) async {
//     try {
//       if (message != null) {
//         await Future.delayed(const Duration(seconds: 6));
//         handlePayload(message.data["link"]);
//       }
//     } catch (e) {
//       consoleLog("<<<<<< initial message exception >>>>>>>>");
//     }
//   });
//
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     try {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? androidNotification = message.notification?.android;
//       if (notification != null && androidNotification != null && !kIsWeb) {
//         consoleLog(">>>>>>>>>>>>> onMessage >>>>>>>>>>>");
//         consoleLog(">>>>>>>>>>>>> ${message.data["link"]} >>>>>>>>12>>>");
//         try {
//           flutterLocalNotificationsPlugin.show(
//               notification.hashCode,
//               notification.title,
//               notification.body,
//               payload: "${message.data["link"]}",
//               NotificationDetails(
//                   android: AndroidNotificationDetails(channel.id, channel.name,
//                       channelDescription: channel.description,
//                       playSound: true,
//                       icon: 'ic_stat_doob_logo',
//                       color: primaryColor,
//                       enableVibration: true,
//                       channelShowBadge: true,
//                       priority: Priority.high),));
//           consoleLog("<<<<<< on try >>>>>>>>");
//         } catch (e) {
//           consoleLog("<<<<<< $e >>>>>>>>");
//         }
//       }
//     } catch (e) {
//       consoleLog("<<<<<< foreground exception >>>>>>>>");
//     }
//     // handlePayload(message.data["link"]);
//   });
//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     try {
//       consoleLog("adasdasdadas");
//       handlePayload(message.data["link"]);
//     } catch (e) {
//       consoleLog("<<<<<< onMessageOpenedApp exception >>>>>>>>");
//     }
//   });
//   // Get.find<HomeScreenController>().subscribe();
//   // fcmSubscribe();
// }
//
// fcmSubscribe() {
//   firebaseMessaging.subscribeToTopic("topic12");
//   // firebaseMessaging.subscribeToTopic(ApiConstants.generalTopic);
//   // Get.find<HomeScreenController>().subscribe();
//   // firebaseMessaging.subscribeToTopic(ApiConstants.generalTopic);
// }
//
// void fcmUnsubscribe() {
//   firebaseMessaging.unsubscribeFromTopic('topic12');
// }
//
// Future<String> getToken() async {
//   String? token = await firebaseMessaging.getToken();
//   return token!;
// }
//
// handlePayload(String? data) async {
//   consoleLog(">>>>>>>>>>>> handlePayload <<<<<<<<<<<<<<");
//   consoleLog(">>>>>>>>>>>> $data <<<<<<<<<<<<<<");
//   if (data != "" && data != null && data != "null") {
//     var a = data.split('/');
//     var id = a.last;
//     var type = a[a.length - 2];
//     consoleLog(id);
//     consoleLog(type);
//     if (type == "product") {
//       Get.toNamed(RouteList.productDetailsScreen, arguments: id);
//     } else {
//       Get.find<NotificationScreenController>().getData();
//       Get.toNamed(RouteList.notificationScreen);
//     }
//     // } else if (data.contains("shop?category")) {
//     //   var i = data.split('/');
//     //   var id = i[3].split('=');
//     //   Get.toNamed(RouteList.productListScreen,
//     //       arguments: ProductListArguments(categorySlug: id[1]));
//     // } else if (data.contains("shop?offer")) {
//     //   var i = data.split('/');
//     //   var id = i[3].split('=');
//     //   Get.toNamed(RouteList.productListScreen,
//     //       arguments: ProductListArguments(offerSlug: id[1]));
//     // } else if (data.contains("my-orders")) {
//     //   var b = data.split('/');
//     //   var orderId = b.last;
//     //   Get.toNamed(RouteList.myOrders, arguments: orderId);
//     // }
//   } else {
//     consoleLog("adfagaggha");
//     Get.find<NotificationScreenController>().getData();
//     Get.toNamed(RouteList.notificationScreen);
//   }
// }
// //https://doob-next.vercel.app/page/post/sjsaviyo_jacob-55cb7d0d-4983-4
// //video_call/33
// //https://doob-next.vercel.app/chat/messages/33
// // https://dev.zainbay.com/account/order-history
