import 'package:flutter/material.dart';

class AppOutlinedButtonThemeData {
  static OutlinedButtonThemeData light(ColorScheme scheme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: scheme.surfaceContainerLowest,
      ).copyWith(
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return scheme.primary.withValues(alpha: 0.08);
          }
          return null;
        }),
        side: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(color: scheme.primary.withValues(alpha: 0.5));
          }
          return BorderSide(color: scheme.primary);
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return scheme.primary.withValues(alpha: 0.5);
          }
          return scheme.primary;
        }),
      ),
    );
  }

  static OutlinedButtonThemeData dark(ColorScheme scheme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: scheme.surfaceContainerLowest,
      ).copyWith(
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return scheme.primary.withValues(alpha: 0.08);
          }
          return null;
        }),
        side: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(color: scheme.primary.withValues(alpha: 0.5));
          }
          return BorderSide(color: scheme.primary);
        }),
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
