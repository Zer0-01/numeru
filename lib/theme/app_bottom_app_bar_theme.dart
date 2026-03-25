import 'package:flutter/material.dart';

class AppBottomAppBarTheme {
  static BottomAppBarThemeData light(ColorScheme scheme) {
    return BottomAppBarThemeData(
      color: scheme.surfaceContainerLowest,
      surfaceTintColor: Colors.transparent,
    );
  }

  static BottomAppBarThemeData dark(ColorScheme scheme) {
    return BottomAppBarThemeData(
      color: scheme.surfaceContainerLowest,
      surfaceTintColor: Colors.transparent,
    );
  }
}
