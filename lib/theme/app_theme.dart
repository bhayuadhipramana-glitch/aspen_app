import 'package:flutter/material.dart';

class AppColors {
  static const Color primary     = Color(0xFF176FF2);
  static const Color primaryLight= Color(0xFFE8F1FE);
  static const Color accent      = Color(0xFFFF6B6B);
  static const Color star        = Color(0xFFFFBF00);
  static const Color white       = Color(0xFFFFFFFF);
  static const Color background  = Color(0xFFF7F9FC);
  static const Color dark        = Color(0xFF1A1A2E);
  static const Color grey        = Color(0xFF9DA3B4);
  static const Color greyLight   = Color(0xFFEEEFF2);
}

class AppTheme {
  static ThemeData get theme => ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
    ),
    useMaterial3: true,
  );
}