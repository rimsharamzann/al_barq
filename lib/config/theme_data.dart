import 'package:flutter/material.dart';

const myPadding = 18.0;

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
    
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.grey.shade100,
      brightness: Brightness.light,
      // background: Colors.grey.shade100,
    ),
    scaffoldBackgroundColor: Colors.grey.shade100,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade100,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black87),
      titleTextStyle: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    fontFamily: 'SF Pro',
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      headlineLarge: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        color: Colors.black87,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        color: Colors.black87,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        fontSize: 14,
        color: Colors.grey.shade700,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: Colors.grey,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),

      labelMedium: TextStyle(
        color: Colors.grey.shade700,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),

      displaySmall: TextStyle(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: const TextStyle(
        fontSize: 14,
        color: Colors.black87,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: Colors.black87,
        fontWeight: FontWeight.w300,
      ),
    ),
  );
}
