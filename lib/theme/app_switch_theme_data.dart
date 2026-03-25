import 'package:flutter/material.dart';

class AppSwitchThemeData {
  static SwitchThemeData light(ColorScheme scheme) {
    return SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled) &&
            states.contains(WidgetState.selected)) {
          return scheme.primary.withValues(alpha: 0.5);
        }

        if (states.contains(WidgetState.disabled) &&
            !states.contains(WidgetState.selected)) {
          return scheme.surfaceContainerLow.withValues(alpha: 0.5);
        }

        if (states.contains(WidgetState.selected)) {
          return scheme.primary;
        }

        return scheme.surfaceContainerLow;
      }),
      trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return scheme.surfaceContainerLowest.withValues(alpha: 0.5);
        }
        return scheme.surfaceContainerLowest;
      }),
    );
  }

  static SwitchThemeData dark(ColorScheme scheme) {
    return SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled) &&
            states.contains(WidgetState.selected)) {
          return scheme.primary.withValues(alpha: 0.5);
        }

        if (states.contains(WidgetState.disabled) &&
            !states.contains(WidgetState.selected)) {
          return scheme.surfaceContainerLow.withValues(alpha: 0.5);
        }

        if (states.contains(WidgetState.selected)) {
          return scheme.primary;
        }

        return scheme.surfaceContainerLow;
      }),
      trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return scheme.surfaceContainerHighest.withValues(alpha: 0.5);
        }
        return scheme.surfaceContainerHighest;
      }),
    );
  }
}
