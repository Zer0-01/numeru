import 'package:flutter/material.dart';

class AppSegmentedButtonThemeData {
  static SegmentedButtonThemeData light(ColorScheme scheme) {
    return SegmentedButtonThemeData(
      style: SegmentedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        selectedBackgroundColor: scheme.primary,
        selectedForegroundColor: scheme.onPrimary,
        backgroundColor: scheme.surfaceContainerLowest,
        foregroundColor: scheme.primary,
      ).copyWith(
        side: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(color: scheme.primary.withValues(alpha: 0.5));
          }
          return BorderSide(color: scheme.primary);
        }),
      ),
    );
  }

  static SegmentedButtonThemeData dark(ColorScheme scheme) {
    return SegmentedButtonThemeData(
      style: SegmentedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        selectedBackgroundColor: scheme.primary,
        selectedForegroundColor: scheme.onPrimary,
        backgroundColor: scheme.surfaceContainerLowest,
        foregroundColor: scheme.primary,
      ).copyWith(
        side: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(color: scheme.primary.withValues(alpha: 0.5));
          }
          return BorderSide(color: scheme.primary);
        }),
      ),
    );
  }
}
