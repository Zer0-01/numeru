import 'package:flutter/material.dart';

class AppInputDecorationTheme {
  static InputDecorationTheme light(ColorScheme scheme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: scheme.surfaceContainerLow,
      isDense: true,
      prefixIconColor: scheme.onSurfaceVariant,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.error),
      ),
      hintStyle: TextStyle(color: scheme.onSurfaceVariant, fontSize: 14),
    );
  }

  static InputDecorationTheme dark(ColorScheme scheme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: scheme.surfaceContainerLowest,
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.error),
      ),
      hintStyle: TextStyle(color: scheme.onSurfaceVariant, fontSize: 14),
    );
  }
}
