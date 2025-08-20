import 'package:flutter/material.dart';
import 'responsive_widget.dart';

class MainThemeData {
  static ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
      fontFamily: 'SF Pro', 
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: ResponsiveWidget.isSmallScreen(context)
              ? 26
              : ResponsiveWidget.isMediumScreen(context)
                  ? 24
                  : 48,
        ),
        titleMedium: TextStyle(
          fontFamily: 'SF Pro', 
          fontSize: ResponsiveWidget.isSmallScreen(context)
              ? 16
              : ResponsiveWidget.isMediumScreen(context)
                  ? 24
                  : 28,
          color: Colors.black87,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          fontSize: ResponsiveWidget.isSmallScreen(context)
              ? 12
              : ResponsiveWidget.isMediumScreen(context)
                  ? 12
                  : 22,
          color: Colors.black87,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: TextStyle(
          fontSize: ResponsiveWidget.isSmallScreen(context) ? 16 : 24,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          fontSize: ResponsiveWidget.isSmallScreen(context) ? 14 : 22,
          color: Colors.black87,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          fontFamily: 'SF Pro', 
          fontSize: ResponsiveWidget.isSmallScreen(context) ? 20 : 28,
          color: Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
