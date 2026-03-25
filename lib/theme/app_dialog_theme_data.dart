import 'package:flutter/material.dart';

class AppDialogThemeData {
  static DialogThemeData light(ColorScheme scheme) {
    return DialogThemeData(
      backgroundColor: scheme.surfaceContainerLowest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    );
  }

  static DialogThemeData dark(ColorScheme scheme) {
    return DialogThemeData(
      backgroundColor: scheme.surfaceContainerLowest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    );
  }
}
