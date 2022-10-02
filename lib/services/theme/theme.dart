import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData themeData() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(color: Colors.white),
          elevation: 0),
      scaffoldBackgroundColor: kSmoothBlack,
    );
  }
}
