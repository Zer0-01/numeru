import 'package:flutter/material.dart';

class AppFloatingActionButtonThemeData {
  static FloatingActionButtonThemeData light(ColorScheme scheme) {
    return FloatingActionButtonThemeData(
      backgroundColor: scheme.primary,
      foregroundColor: scheme.onPrimary,
      shape: const CircleBorder(),
    );
  }

  static FloatingActionButtonThemeData dark(ColorScheme scheme) {
    return FloatingActionButtonThemeData(
      backgroundColor: scheme.primary,
      foregroundColor: scheme.onPrimary,
      shape: const CircleBorder(),
    );
  }
}
