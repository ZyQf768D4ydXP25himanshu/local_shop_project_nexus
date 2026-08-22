import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static const Color primaryBlue = Color(0xFF2563EB);
  static const Color secondaryGreen = Color(0xFF10B981);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        primary: primaryBlue,
        secondary: secondaryGreen,
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}
