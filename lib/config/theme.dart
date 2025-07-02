import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF22223B),
    primaryColor: const Color(0xFF22223B),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF4A4E69),
      brightness: Brightness.dark,
      primary: const Color(0xFF22223B),
      secondary: const Color(0xFF9A8C98),
      surface: const Color(0xFF4A4E69),
      surfaceTint: const Color(0xFF9A8C98),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF4A4E69),
      foregroundColor: Color(0xFF9A8C98),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Color(0xFFF2E9E4),
        fontFamily: 'ChakraPetch',
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
    tabBarTheme: const TabBarThemeData(
      labelColor: Color(0xFFF2E9E4),
      unselectedLabelColor: Color(0xFFC9ADA7),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Color(0xFF9A8C98), width: 4),
      ),
      labelStyle:
          TextStyle(fontFamily: 'ChakraPetch', fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontFamily: 'ChakraPetch'),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Color(0xFFF2E9E4),
        fontFamily: 'ChakraPetch',
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Color(0xFFF2E9E4),
        fontFamily: 'ChakraPetch',
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Color(0xFFF2E9E4),
        fontFamily: 'Inter',
      ),
      bodyMedium: TextStyle(
        color: Color(0xFFF2E9E4),
        fontFamily: 'Inter',
      ),
    ),
    fontFamily: 'Inter',
    useMaterial3: true,
  );
}
