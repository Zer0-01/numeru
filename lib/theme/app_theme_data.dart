import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColorSchemes {
  static ColorScheme light = ColorScheme(
    brightness: Brightness.light,
    primary: Colors.pink.shade800,
    onPrimary: Colors.white,
    primaryContainer: Colors.pink.shade50,
    onPrimaryContainer: Colors.grey,
    primaryFixed: Colors.pink.shade200,
    secondary: Colors.indigo,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.grey.shade100,
    onSurface: Colors.black,
    surfaceContainer: Colors.grey,
    surfaceContainerLowest: Colors.white,
    surfaceContainerLow: Colors.grey.shade200,
    surfaceContainerHigh: Colors.grey.shade700,
    surfaceContainerHighest: Colors.black,
  );

  static ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.pink.shade800,
    onPrimary: Colors.white,
    secondary: Colors.indigo,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.black,
    onSurface: Colors.white,
    surfaceContainer: Colors.grey,
    surfaceContainerLowest: Colors.grey.shade900,
    surfaceContainerLow: Colors.grey.shade700,
    surfaceContainerHigh: Colors.grey.shade200,
    surfaceContainerHighest: Colors.white,
    outline: Colors.grey,
  );
}

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

class AppAppBarTheme {
  static AppBarTheme light(ColorScheme scheme) {
    return AppBarTheme(
      backgroundColor: scheme.surface,
      foregroundColor: scheme.onSurface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: scheme.onSurface),
      titleTextStyle: TextStyle(
        color: scheme.onSurface,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static AppBarTheme dark(ColorScheme scheme) {
    return AppBarTheme(
      backgroundColor: scheme.surface,
      foregroundColor: scheme.onSurface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: scheme.onSurface),
      titleTextStyle: TextStyle(
        color: scheme.onSurface,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class AppInputDecorationTheme {
  static InputDecorationTheme light(ColorScheme scheme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: scheme.surfaceContainerLowest,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.outlineVariant),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.outlineVariant),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.primary, width: 1.5),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.error),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.error, width: 1.5),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: scheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),

      labelStyle: TextStyle(color: scheme.onSurfaceVariant),
      hintStyle: TextStyle(
        color: scheme.onSurfaceVariant.withValues(alpha: 0.6),
      ),
      helperStyle: TextStyle(color: scheme.onSurfaceVariant),
      errorStyle: TextStyle(color: scheme.error),
    );
  }

  static InputDecorationTheme dark(ColorScheme scheme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: scheme.surfaceContainerLowest,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.outlineVariant),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.outlineVariant),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.primary, width: 1.5),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.error),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.error, width: 1.5),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: scheme.outlineVariant.withValues(alpha: 0.4),
        ),
      ),

      labelStyle: TextStyle(color: scheme.onSurfaceVariant),
      hintStyle: TextStyle(
        color: scheme.onSurfaceVariant.withValues(alpha: 0.6),
      ),
      helperStyle: TextStyle(color: scheme.onSurfaceVariant),
      errorStyle: TextStyle(color: scheme.error),
    );
  }
}

class AppThemeData {
  static ThemeData light() {
    final scheme = AppColorSchemes.light;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: GoogleFonts.sourceSans3().fontFamily,
      colorScheme: scheme,
      switchTheme: AppSwitchThemeData.light(scheme),
      appBarTheme: AppAppBarTheme.light(scheme),
      inputDecorationTheme: AppInputDecorationTheme.light(scheme),
    );
  }

  static ThemeData dark() {
    final scheme = AppColorSchemes.dark;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.sourceSans3().fontFamily,
      colorScheme: scheme,
      switchTheme: AppSwitchThemeData.dark(scheme),
      appBarTheme: AppAppBarTheme.dark(scheme),
      inputDecorationTheme: AppInputDecorationTheme.dark(scheme),
    );
  }
}
