import 'package:flutter/material.dart';

class AppCheckboxThemeData {
  static CheckboxThemeData light(ColorScheme scheme) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return scheme.primary;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStatePropertyAll(scheme.onPrimary),
      side: WidgetStateBorderSide.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return BorderSide.none;
        }
        return BorderSide(color: scheme.outline);
      }),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    );
  }

  static CheckboxThemeData dark(ColorScheme scheme) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return scheme.primary;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStatePropertyAll(scheme.onPrimary),
      side: WidgetStateBorderSide.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return BorderSide.none;
        }
        return BorderSide(color: scheme.outline);
      }),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    );
  }
}
