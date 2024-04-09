import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';

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

const dividerColor = Color(0xFFC4C4C4);
const backGroundColor = Color(0xFFffffff);
const bgLightBlue = Color(0xFFF2F6F9);
const lightGrey = Color(0xFFEEEEEE);
// const lightGrey = Color(0xFFf1f2f6);
const whiteColor = Colors.white;
const greyColor = Color(0xff959595);
const primaryColor = Color(0xFF17A803);
const errorColor = Color(0xFFFC4444);
const blackColor = Color(0xff000000);
const greenColor = Color(0xff4BB543);
const warningColor = Color(0xFFFF640D);
// const offWhite = Color(0xffCED2D6);

const darkGrey = Color(0xff343C42);
const lightColor = Color(0xffC3C0C3);
const offWhite = Color(0xffE8E8E8);
// const darkGrey = Color(0xff666666);
const darkBackground = Color(0xff192126);
const darkButtonColor = Color(0xff1e282e);
const darkButtonSecondaryColor = Color(0xff515661);

const defaultShadow = [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(2, 5),
    blurRadius: 5,
  )
];

setSystemOverlay() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    //  DeviceOrientation.portraitDown
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness:
        Platform.isAndroid ? Brightness.dark : Brightness.light,
    // systemNavigationBarColor: Colors.white,
    // systemNavigationBarDividerColor: Colors.grey,
    // systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

ThemeData themeData(context) {
  return ThemeData.light().copyWith(
    scaffoldBackgroundColor: whiteColor,
    listTileTheme: const ListTileThemeData(iconColor: blackColor),
    // androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
    // platform: TargetPlatform.android,
    cardTheme: CardTheme(
        color: lightGrey,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultPadding * .5))),
    popupMenuTheme: const PopupMenuThemeData(textStyle: TextStyle(fontSize: 13),),
    iconTheme: const IconThemeData(color: blackColor),
    tabBarTheme: TabBarTheme(
        labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        labelColor: primaryColor,
        unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
        unselectedLabelColor: blackColor,
        indicator: const UnderlineTabIndicator(
            // insets: EdgeInsets.symmetric(horizontal: defaultPadding * 3),
            borderSide: BorderSide(color: primaryColor,width: 2))),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: primaryColor),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
          horizontal: defaultPadding / 2, vertical: defaultPadding * .8),
      hintStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      fillColor: lightGrey,
      filled: true,
      iconColor: primaryColor,
      labelStyle: const TextStyle(color: greyColor),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultPadding / 2),
          borderSide: const BorderSide(color: primaryColor)),
      border: OutlineInputBorder(
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          borderRadius: BorderRadius.circular(defaultPadding / 2)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: const IconThemeData(
          color: primaryColor,
          size: 28,
        ),
        unselectedIconTheme: const IconThemeData(color: Colors.white70),
        // selectedIconTheme: IconThemeData(color: whiteColor),
        unselectedItemColor: blackColor.withOpacity(.75),
        // unselectedFontSize: 14,
        backgroundColor: whiteColor,
        showUnselectedLabels: true,
        selectedItemColor: primaryColor,
        // unselectedItemColor: Colors.white70,
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(inherit: true, letterSpacing: 0),
        selectedLabelStyle:
            Theme.of(context).textTheme.labelMedium?.copyWith(inherit: true,color: primaryColor)),
    // textTheme: GoogleFonts.interTextTheme(),
    chipTheme: Theme.of(context).chipTheme.copyWith(
        secondaryLabelStyle: const TextStyle(color: whiteColor),
        secondarySelectedColor: primaryColor),
    appBarTheme: const AppBarTheme(
        color: whiteColor,
        elevation: 0,
        iconTheme: IconThemeData(color: blackColor)),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(defaultPadding * .5),
        ),
      ),
    ),
    checkboxTheme: const CheckboxThemeData(fillColor: MaterialStatePropertyAll(blackColor),),
    radioTheme: const RadioThemeData(
      fillColor: MaterialStatePropertyAll(blackColor),
    ),
  );
}

ThemeData themeDataDark(context) {
  return ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(secondary: darkGrey,primary: Colors.blue,),
    scaffoldBackgroundColor: darkBackground,
    // // androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
    // // platform: TargetPlatform.android,
    iconTheme: const IconThemeData(color: whiteColor),
    cardTheme: CardTheme(
        color: darkGrey,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultPadding * .5))),
    popupMenuTheme: const PopupMenuThemeData(textStyle: TextStyle(fontSize: 13)),
    // tabBarTheme: TabBarTheme(
    //     labelStyle: Theme.of(context).textTheme.titleLarge,
    //     labelColor: blackColor,
    //     indicator: const UnderlineTabIndicator(
    //         insets: EdgeInsets.symmetric(horizontal: defaultPadding * 3),
    //         borderSide: BorderSide(color: primaryColor))),
    // textSelectionTheme: const TextSelectionThemeData(cursorColor: primaryColor),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
          horizontal: defaultPadding / 2, vertical: defaultPadding * .8),
      fillColor: darkGrey,
      filled: true,
      iconColor: primaryColor,
      labelStyle: const TextStyle(color: greyColor),
      hintStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultPadding / 2),
          borderSide: const BorderSide(color: primaryColor)),
      border: OutlineInputBorder(
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          borderRadius: BorderRadius.circular(defaultPadding / 2)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: darkGrey,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: darkGrey, width: 1.5),
          borderRadius: BorderRadius.circular(defaultPadding * .5),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkGrey,
        selectedIconTheme: const IconThemeData(
          color: primaryColor,
          size: 28,
        ),
        unselectedIconTheme: const IconThemeData(color: Colors.white70),
        // selectedIconTheme: IconThemeData(color: whiteColor),
        unselectedItemColor: whiteColor.withOpacity(.75),
        // unselectedFontSize: 14,
        // backgroundColor: whiteColor,
        showUnselectedLabels: true,
        selectedItemColor: primaryColor,
        // unselectedItemColor: Colors.white70,
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(inherit: true, letterSpacing: 0),
        selectedLabelStyle: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(inherit: true, color: primaryColor)),
    // textTheme: GoogleFonts.interTextTheme(getTextTheme(context)),
    // chipTheme: Theme.of(context).chipTheme.copyWith(
    //     secondaryLabelStyle: const TextStyle(color: whiteColor),
    //     secondarySelectedColor: primaryColor),
    appBarTheme: const AppBarTheme(
      color: darkGrey,
      elevation: 0,
      iconTheme: IconThemeData(color: whiteColor),
      actionsIconTheme: IconThemeData(color: whiteColor),
    ),
    // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
    chipTheme: const ChipThemeData(
      backgroundColor: darkGrey,
      selectedColor: darkGrey,
      disabledColor: darkGrey,
      // surfaceTintColor: darkGrey,
    ),
    radioTheme: const RadioThemeData(
      fillColor: MaterialStatePropertyAll(whiteColor),
    ),
  );
}

extension ThemeExtension on TextTheme {
  TextStyle headline6BoldWhite() =>
      titleLarge!.copyWith(fontWeight: FontWeight.bold, color: whiteColor);

  TextStyle headline6BoldPrimary() =>
      titleLarge!.copyWith(fontWeight: FontWeight.bold, color: primaryColor);

  TextStyle headline6NormalPrimary() =>
      titleLarge!.copyWith(fontWeight: FontWeight.normal, color: primaryColor);

  TextStyle headline3BoldWhite() =>
      displaySmall!.copyWith(fontWeight: FontWeight.bold, color: whiteColor);

  TextStyle headline4BoldPink() =>
      displaySmall!.copyWith(fontWeight: FontWeight.bold, color: primaryColor);
}

extension Sizedbox on num {
  SizedBox get sBH => SizedBox(height: toDouble());
  SizedBox get sBW => SizedBox(width: toDouble());
}

extension StringExtension on String{
  String get upperFirst=>"${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}

// extension SampleText on String {
//   Text get errorText => Text(toString(),style: const TextStyle(color: Colors.red),);
// }