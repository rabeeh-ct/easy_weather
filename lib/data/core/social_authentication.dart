// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// import '../../utils/debug_utils.dart';
// import '../../utils/snackbar_utils.dart';
//
// class SocialAuthentication {
//   static Future<User?> signInWithGoogle() async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//
//     final GoogleSignInAccount? googleSignInAccount =
//         await googleSignIn.signIn();
//
//     if (googleSignInAccount != null) {
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount.authentication;
//
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );
//
//       try {
//         final UserCredential userCredential =
//             await auth.signInWithCredential(credential);
//         user = userCredential.user;
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'account-exists-with-different-credential') {
//           showMessage(AppLocalizations.of(Get.context!)!.email_already_exist);
//         } else if (e.code == 'invalid-credential') {
//           // handle the error here
//         }
//       } catch (e) {
//         showMessage(AppLocalizations.of(Get.context!)!.sorry_try_again_later);
//         // handle the error here
//       }
//     }
//     return user;
//   }
//
//   static Future<User?> signInWithFaceBook() async {
//     // User? user;
//     // // Trigger the sign-in flow
//     // final LoginResult loginResult = await FacebookAuth.instance.login();
//     //
//     // // Create a credential from the access token
//     // final OAuthCredential facebookAuthCredential =
//     // FacebookAuthProvider.credential(
//     //   loginResult.accessToken!.token,
//     // );
//     // // Once signed in, return the UserCredential
//     // try {
//     //  final usercredential= await FirebaseAuth.instance
//     //       .signInWithCredential(facebookAuthCredential);
//     //  user=usercredential.user;
//     // } on FirebaseAuthException catch (e) {
//     //   consoleLog(e.code);
//     // }
//     // showMessage('You have Successfully Logged in');
//     // return user;
//
//     consoleLog("facebook function");
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//     try {
//       final LoginResult result = await FacebookAuth.instance.login();
//       consoleLog("facebook function 2");
//       if (result.status == LoginStatus.success) {
//         final AuthCredential facebookCredential =
//             FacebookAuthProvider.credential(result.accessToken!.token);
//         final userCredential =
//             await auth.signInWithCredential(facebookCredential);
//         user = userCredential.user;
//       }
//     } on FirebaseAuthException catch (e) {
//       consoleLog(e.email);
//       if (e.code == "account-exists-with-different-credential") {
//         showMessage(AppLocalizations.of(Get.context!)!.email_already_exist);
//       } else {
//         showMessage(AppLocalizations.of(Get.context!)!.sorry_try_again_later);
//       }
//     }
//     return user;
//   }
//
//   static socialLogout() async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//     await googleSignIn.signOut();
//     await auth.signOut();
//     await FacebookAuth.instance.logOut();
//   }
// }
