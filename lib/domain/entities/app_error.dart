// ignore_for_file: depend_on_referenced_packages


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/constants.dart';
import '../../presentation/theme/theme.dart';

class AppError {
  final AppErrorType appErrorType;

  AppError(this.appErrorType);

  handleError({required BuildContext context}) {

    // Get.snackbar("Unexpected Error", errorMessage(),
    //     backgroundColor: primaryColor,
    //     colorText: whiteColor,
    //     isDismissible: true,
    //     duration: const Duration(milliseconds: 700),
    //     animationDuration: const Duration(milliseconds: 400));

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),

      backgroundColor: primaryColor,
      content: Text(
        errorMessage(),
        textScaleFactor: 1.0,
        style: const TextStyle(
            color: whiteColor, fontWeight: FontWeight.bold, fontSize: 14),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(defaultPadding / 2))),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(
          horizontal: defaultPadding / 2, vertical: defaultPadding),
    ));
  }

  String errorMessage() {
    switch (appErrorType) {
      case AppErrorType.api:
        return apiError;
      case AppErrorType.network:
        return networkError;
      case AppErrorType.databse:
        return databseError;
      case AppErrorType.unauthorised:
        return unauthorisedError;
      case AppErrorType.sessionDenied:
        return sessionDeniedError;
      case AppErrorType.unexpected:
        return sessionDeniedError;
    }
  }
}

enum AppErrorType {
  api,
  network,
  databse,
  unauthorised,
  sessionDenied,
  unexpected
}
