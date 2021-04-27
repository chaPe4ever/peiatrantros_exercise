import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppTheme {
  static ThemeData get themeData {
    // TODO define your own flavors if needed
    return ThemeData(primaryColor: Colors.blueGrey);
  }
}

extension CustomTextTheme on TextTheme {
  TextStyle get defaultDialogButtonTS => TextStyle(
        color: Get.theme?.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: Get.context?.isPhone ?? true ? 16.0 : 24.0,
      );

  TextStyle get snackBarMsgTS => TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: Get.context?.isPhone ?? true ? 14.0 : 24.0,
      );

  TextStyle get topCardTitleTS => TextStyle(
        color: Colors.white,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      );

  TextStyle get topCardSubTitleTS => TextStyle(
        color: Colors.white38,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      );
  TextStyle get todaysTaskTS =>
      TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0);

  TextStyle get todaysTaskCardTitleTS =>
      TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0);

  TextStyle get todaysTaskCardDescriptionTS => TextStyle(
      fontWeight: FontWeight.w300, color: Color(0xff78909c), fontSize: 14.0);

  TextStyle get todaysTaskCardTimeTS => TextStyle(
      fontWeight: FontWeight.w700, color: Color(0xff78909c), fontSize: 14.0);

  TextStyle get taskOverviewCreatedByDoctorTS => TextStyle(
      fontWeight: FontWeight.normal, color: Color(0xff78909c), fontSize: 14.0);

  TextStyle get taskOverviewDescriptionBoldTS =>
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0);

  TextStyle get taskOverviewDescriptionLightTS =>
      TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0);
}

extension CustomInputDecoration on InputDecoration {}

extension CustomColorScheme on ColorScheme {
  Color get defaultBgColor => const Color(0xff9f9f9);
  Color get todaysTaskCardSecondaryColor => const Color(0xff78909c);
  Color get almostBlackColor => const Color(0xff010202);
  Color get dividerColor => const Color(0xffd8d8d8);
}
