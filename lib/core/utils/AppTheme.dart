import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_color.dart';

final ThemeData appTheme = ThemeData(
  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  fontFamily: 'cairo',
  primaryColorDark: AppColor.primary,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  primaryColor: const Color(0xFF00A6FF), // اللون الأزرق الفاتح للزر
  colorScheme: const ColorScheme.dark(
    primary: AppColor.primary,
    secondary: AppColor.secondPrimary,
    surface: AppColor.black,

  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,

    hintStyle: TextStyle(color: const Color(0xFFC4C4C4)),
    labelStyle: const TextStyle(color: Colors.white),
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 26,
      fontWeight: FontWeight.bold,
    ),
     bodySmall: TextStyle(color: Colors.white, fontSize: 14),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 16),

    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.primary,
      foregroundColor: Colors.white,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.symmetric(vertical: 14),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: AppColor.primary),
  ),
);
