import 'package:flutter/material.dart';

class AppTextStyles {
    AppTextStyles._();
  static TextTheme get lightTextTheme => const TextTheme(
     displayLarge: AppTextStyles.bold,
    titleLarge: AppTextStyles.medium,
    bodyMedium: AppTextStyles.regular,
  );
  static const TextStyle regular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 14, // Adjust size as needed
    color: Colors.black, // Set a default color
  );

  static const TextStyle medium = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 16, // Adjust size as needed
    color: Colors.black, // Set a default color
  );

  static const TextStyle bold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w800,
    fontSize: 18, // Adjust size as needed
    color: Colors.black, // Set a default color
  );

  static TextStyle coloredRegular(Color? color, FontWeight? fontWeight, double? fontSize) {
    return regular.copyWith(color: color ?? Colors.black, fontWeight: fontWeight ?? FontWeight.w600, fontSize: fontSize ?? 10);
  }

  static TextStyle coloredMedium(Color? color, FontWeight? fontWeight, double? fontSize) {
    return medium.copyWith(color: color ?? Colors.black, fontWeight: fontWeight ?? FontWeight.w600, fontSize: fontSize ?? 10);
  }

  static TextStyle coloredBold( Color? color, FontWeight? fontWeight, double? fontSize) {
    return bold.copyWith(color: color ?? Colors.black, fontWeight: fontWeight ?? FontWeight.w600, fontSize: fontSize ?? 10);
  }

  static mediumStyle(int i) {}
}
