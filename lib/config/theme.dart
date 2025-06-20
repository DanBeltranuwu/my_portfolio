import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: const Color(0xFF39FF14), // Neon green
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF39FF14),
      brightness: Brightness.dark,
      primary: const Color(0xFF39FF14),
      secondary: const Color(0xFF00FFFF), // Neon cyan
      background: Colors.black,
      surface: Colors.grey[900],
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Color(0xFF39FF14),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Color(0xFF39FF14),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Color(0xFF39FF14),
      unselectedLabelColor: Colors.white70,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Color(0xFF00FFFF), width: 4),
      ),
      labelStyle:
          TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontFamily: 'Montserrat'),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Color(0xFF39FF14),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Color(0xFF00FFFF),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontFamily: 'Montserrat',
      ),
      bodyMedium: TextStyle(
        color: Colors.white70,
        fontFamily: 'Montserrat',
      ),
    ),
    fontFamily: 'Montserrat',
    useMaterial3: true,
  );
}
