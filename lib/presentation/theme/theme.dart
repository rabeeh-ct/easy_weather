
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const defaultPadding = 20.0;
const defaultAppBarHeight = 56.0;
const defaultSpacer = SizedBox(
  height: defaultPadding,
);
const defaultSpacerSmall = SizedBox(
  height: defaultPadding / 2,
);
const defaultSpacerHorizontal = SizedBox(width: defaultPadding);
const defaultSpacerHorizontalSmall = SizedBox(
  width: defaultPadding / 2,
);

const defaultAnimationDuration = Duration(milliseconds: 500);

setSystemOverlay() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    //  DeviceOrientation.portraitDown
  ]);
}

extension Sizedbox on num {
  SizedBox get sBH => SizedBox(height: toDouble());
  SizedBox get sBW => SizedBox(width: toDouble());
}

extension StringExtension on String{
  String get upperFirst=>"${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}
