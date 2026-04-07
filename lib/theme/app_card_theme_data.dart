import 'package:flutter/material.dart';

class AppCardThemeData {
  static CardThemeData light(ColorScheme scheme) {
    return CardThemeData(
      color: scheme.surfaceContainerLowest,
      elevation: 1,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
    );
  }

  static CardThemeData dark(ColorScheme scheme) {
    return CardThemeData(
      color: scheme.surfaceContainerLowest,
      elevation: 1,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
    );
  }
}
