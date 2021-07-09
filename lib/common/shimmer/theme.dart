// This file stores all the general style

import 'package:flutter/material.dart';

final appTheme = ThemeData(
  //primarySwatch: MaterialColor(),
  primaryColor: CustomizedColors.background1,
  appBarTheme: AppBarTheme(color: CustomizedColors.background1),
  scaffoldBackgroundColor: CustomizedColors.background1,
  textTheme: TextTheme(
    headline1: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.black,
    ),
  ),
);

class CustomizedColors {
  static const dark2 = const Color(0xff333333);
  static const white1 = const Color(0xffffffff);
  static const gray1 = const Color(0xffd4d4d4);
  static const dark1 = const Color(0xff000000);
  static const brand = const Color(0xffd64c57);
  static const gray2 = const Color(0xffe5e5e5);
  static const gray2DarkMode = const Color(0xff333333);
  static const gray1DarkMode = const Color(0xff7d7d7d);
  static const gray3DarkMode = const Color(0xff979797);
  //static const background1 = const Color(0xfff7f7fb);
  static const background1 = const Color(0xffffffff);
  static const background2 = const Color(0xff292929);
  static const gray4DarkMode = const Color(0xff525252);
  static const dark125 = const Color(0x40000000);
  static const green = const Color(0xffa9ffb2);
  static const textfieldBorder = const Color(0xfff2f4f8);
  static const shadow = const Color(0x267090b0);
}

class Spacing {
  static const double small = 6;
  static const double medium = 10;
  static const double big = 16;
}

DecoratedBox decoratedTextBox(String content, Color themeColor, Color textColor,
    {TextAlign textAlign: TextAlign.center}) {
  return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: themeColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Text(content,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w700,
                fontFamily: "Inter",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
            textAlign: textAlign),
      ));
}
