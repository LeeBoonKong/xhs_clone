import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// This class is the configuration for your theme
// Edit this class to suit your needs on your application's theme
class ThemeConfig {
  static ThemeData getTheme() {
    return ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(),
      primaryColor: Colors.lightBlue[800],

      // Define the default font family.
      fontFamily: 'Roboto',

      // Define the default `TextTheme`. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 72.sp, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 36.sp, fontStyle: FontStyle.italic),
        bodyMedium: TextStyle(fontSize: 14.sp, fontFamily: 'Hind'),
      ),
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(),
      primaryColor: Colors.lightBlue[800],

      // Define the default font family.
      fontFamily: 'Roboto',

      // Define the default `TextTheme`. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 72.sp, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 36.sp, fontStyle: FontStyle.italic),
        bodyMedium: TextStyle(fontSize: 14.sp, fontFamily: 'Hind'),
      ),
    );
  }
}
