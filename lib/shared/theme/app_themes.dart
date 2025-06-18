import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: AppTypography.textTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    ),
  );
}
