import 'package:flutter/material.dart';

class AppIconButtonThemeData {
  static IconButtonThemeData light(ColorScheme scheme) {
    return IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return scheme.primary.withValues(alpha: 0.5);
          }
          return scheme.primary;
        }),
      ),
    );
  }

  static IconButtonThemeData dark(ColorScheme scheme) {
    return IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return scheme.primary.withValues(alpha: 0.5);
          }
          return scheme.primary;
        }),
      ),
    );
  }
}
