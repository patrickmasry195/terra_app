import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),

    fontFamily: 'JosefinSans',
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    ),
  );
}
