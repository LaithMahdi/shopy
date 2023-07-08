import 'package:flutter/material.dart';
import 'package:shopy/core/constant/color.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "Montserrat",
  colorSchemeSeed: AppColor.primaryColorBlue,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      color: AppColor.primaryColorGrey,
    ),
    headlineLarge: TextStyle(
      fontSize: 16,
      color: AppColor.primaryColorWhite,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: 14,
      color: Color(0xFF3E4958),
      fontWeight: FontWeight.w600,
    ),
  ),
);

ThemeData themeArabic = ThemeData();
