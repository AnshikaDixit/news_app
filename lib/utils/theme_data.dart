// lib/theme/theme.dart

import 'package:flutter/material.dart';
import 'package:news_app/constants/app_colors.dart';
import 'package:news_app/utils/app_text_style.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: kcPrimaryColor,
    scaffoldBackgroundColor: kcWhiteColor,  // Background with light opacity
    appBarTheme: const AppBarTheme(
      backgroundColor: kcWhiteColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: kcPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      iconTheme: IconThemeData(color: kcPrimaryColor),
    ),
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: kcBlueColor,
    ),
  );

  // Text Theme
  static const TextTheme _textTheme = TextTheme(
    displayLarge: AppTextStyles.bold,
    titleLarge: AppTextStyles.medium,
    bodyMedium: AppTextStyles.regular,
  );

  // Input decoration theme for form fields
  static const InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: kcGreyColor),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kcGreyColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kcPrimaryColor),
    ),
  );

  // Button styling
  static final ElevatedButtonThemeData _elevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kcPrimaryColor,
      textStyle: AppTextStyles.coloredBold(Colors.white, FontWeight.w600, 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
