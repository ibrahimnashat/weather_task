import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class ApplicationTheme {
  ThemeData get styleTheme;
}

@LazySingleton(as: ApplicationTheme)
class WeatherTheme extends ApplicationTheme {
  @override
  ThemeData get styleTheme {
    return ThemeData(
      backgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        circularTrackColor: Colors.orange,
        color: Colors.black,
      ),
      textTheme: const TextTheme(
        ///title text styles [TextStyle] for titles
        titleLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontSize: 28.0),
        titleSmall: TextStyle(fontSize: 24.0),

        ///body text styles [TextStyle] for bodies
        bodySmall: TextStyle(fontSize: 16.0),
        bodyMedium: TextStyle(fontSize: 18.0),
        bodyLarge: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
