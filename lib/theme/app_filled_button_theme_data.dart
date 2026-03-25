import 'package:flutter/material.dart';

class AppFilledButtonThemeData {
  static FilledButtonThemeData light(ColorScheme scheme) {
    return FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return scheme.primary.withValues(alpha: 0.5);
          }
          return scheme.primary;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return scheme.onPrimary.withValues(alpha: 0.5);
          }
          return scheme.onPrimary;
        }),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  static FilledButtonThemeData dark(ColorScheme scheme) {
    return FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return scheme.primary.withValues(alpha: 0.5);
          }
          return scheme.primary;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return scheme.onPrimary.withValues(alpha: 0.5);
          }
          return scheme.onPrimary;
        }),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
