import 'package:flutter/material.dart';

class AppAppBarTheme {
  static AppBarTheme light(ColorScheme scheme) {
    return AppBarTheme(
      backgroundColor: scheme.surfaceContainerLowest,
      foregroundColor: scheme.onSurface,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
    );
  }

  static AppBarTheme dark(ColorScheme scheme) {
    return AppBarTheme(
      backgroundColor: scheme.surface,
      foregroundColor: scheme.onSurface,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
    );
  }
}
