import 'package:flutter/material.dart';

class AppDividerThemeData {
  static DividerThemeData light(ColorScheme scheme) {
    return DividerThemeData(color: scheme.outline, thickness: 1, space: 1);
  }

  static DividerThemeData dark(ColorScheme scheme) {
    return DividerThemeData(color: scheme.outline, thickness: 1, space: 1);
  }
}
