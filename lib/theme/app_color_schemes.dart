import 'package:flutter/material.dart';

class AppColorSchemes {
  static ColorScheme light = ColorScheme(
    brightness: Brightness.light,
    primary: Colors.pink.shade800,
    onPrimary: Colors.white,
    primaryContainer: Colors.pink.shade50,
    onPrimaryContainer: Colors.grey,
    primaryFixed: Colors.pink.shade200,
    secondary: Colors.indigo,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.grey.shade100,
    onSurface: Colors.black,
    onSurfaceVariant: Colors.grey.shade700,
    surfaceContainer: Colors.grey,
    surfaceContainerLowest: Colors.white,
    surfaceContainerLow: Colors.grey.shade200,
    surfaceContainerHigh: Colors.grey.shade700,
    surfaceContainerHighest: Colors.black,
  );

  static ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.pink.shade800,
    onPrimary: Colors.white,
    secondary: Colors.indigo,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.black,
    onSurface: Colors.white,
    surfaceContainer: Colors.grey,
    surfaceContainerLowest: Colors.grey.shade900,
    surfaceContainerLow: Colors.grey.shade700,
    surfaceContainerHigh: Colors.grey.shade200,
    surfaceContainerHighest: Colors.white,
    outline: Colors.grey,
  );
}
