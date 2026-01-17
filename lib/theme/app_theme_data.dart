import 'package:flutter/cupertino.dart';
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
    onSurfaceVariant: Colors.grey.shade700,
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

class AppFilledButtonThemeData {
  static FilledButtonThemeData light(ColorScheme scheme) {
    return FilledButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}

class AppOutlinedButtonThemeData {
  static OutlinedButtonThemeData light(ColorScheme scheme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ).copyWith(
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return scheme.primary.withValues(alpha: 0.08);
          }
          return null;
        }),
        side: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(color: scheme.primary.withValues(alpha: 0.2));
          }
          return BorderSide(color: scheme.primary);
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return scheme.primary.withValues(alpha: 0.2);
          }
          return scheme.primary;
        }),
      ),
    );
  }
}

class AppDialogThemeData {
  static DialogThemeData light(ColorScheme scheme) {
    return DialogThemeData(
      backgroundColor: scheme.surfaceContainerLowest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

class AppAppBarTheme {
  static AppBarTheme light(ColorScheme scheme) {
    return AppBarTheme(
      backgroundColor: scheme.surface,
      foregroundColor: scheme.onSurface,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
    );
  }

  static AppBarTheme dark(ColorScheme scheme) {
    return AppBarTheme(
      backgroundColor: scheme.surface,
      foregroundColor: scheme.onSurface,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
    );
  }
}

class AppBottomAppBarTheme {
  static BottomAppBarThemeData light(ColorScheme scheme) {
    return BottomAppBarThemeData(
      color: scheme.surfaceContainerLowest,

      surfaceTintColor: Colors.transparent,
    );
  }

  static BottomAppBarThemeData dark(ColorScheme scheme) {
    return BottomAppBarThemeData(
      color: scheme.surfaceContainerLowest,

      surfaceTintColor: Colors.transparent,
    );
  }
}

class AppInputDecorationTheme {
  static InputDecorationTheme light(ColorScheme scheme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: scheme.surfaceContainerLow,
      isDense: true,
      prefixIconColor: scheme.onSurfaceVariant,
    );
  }

  static InputDecorationTheme dark(ColorScheme scheme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: scheme.surfaceContainerLowest,
      isDense: true,
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
      cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
      switchTheme: AppSwitchThemeData.light(scheme),
      appBarTheme: AppAppBarTheme.light(scheme),
      inputDecorationTheme: AppInputDecorationTheme.light(scheme),
      filledButtonTheme: AppFilledButtonThemeData.light(scheme),
      outlinedButtonTheme: AppOutlinedButtonThemeData.light(scheme),
      dialogTheme: AppDialogThemeData.light(scheme),
      bottomAppBarTheme: AppBottomAppBarTheme.light(scheme),
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
