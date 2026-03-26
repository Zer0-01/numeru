import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeru/theme/app_app_bar_theme.dart';
import 'package:numeru/theme/app_bottom_app_bar_theme.dart';
import 'package:numeru/theme/app_chip_theme_data.dart';
import 'package:numeru/theme/app_color_schemes.dart';
import 'package:numeru/theme/app_dialog_theme_data.dart';
import 'package:numeru/theme/app_divider_theme_data.dart';
import 'package:numeru/theme/app_filled_button_theme_data.dart';
import 'package:numeru/theme/app_input_decoration_theme.dart';
import 'package:numeru/theme/app_outlined_button_theme_data.dart';
import 'package:numeru/theme/app_switch_theme_data.dart';
import 'package:numeru/theme/app_text_button_theme_data.dart';
import 'package:numeru/theme/app_segmented_button_theme_data.dart';
import 'package:numeru/theme/app_icon_button_theme_data.dart';

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
      filledButtonTheme: AppFilledButtonThemeData.light(scheme),
      outlinedButtonTheme: AppOutlinedButtonThemeData.light(scheme),
      textButtonTheme: AppTextButtonThemeData.light(scheme),
      dividerTheme: AppDividerThemeData.light(scheme),
      dialogTheme: AppDialogThemeData.light(scheme),
      bottomAppBarTheme: AppBottomAppBarTheme.light(scheme),
      chipTheme: AppChipThemeData.light(scheme),
      segmentedButtonTheme: AppSegmentedButtonThemeData.light(scheme),
      iconButtonTheme: AppIconButtonThemeData.light(scheme),
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
      dialogTheme: AppDialogThemeData.dark(scheme),
      chipTheme: AppChipThemeData.dark(scheme),
      filledButtonTheme: AppFilledButtonThemeData.dark(scheme),
      outlinedButtonTheme: AppOutlinedButtonThemeData.dark(scheme),
      textButtonTheme: AppTextButtonThemeData.dark(scheme),
      dividerTheme: AppDividerThemeData.dark(scheme),
      bottomAppBarTheme: AppBottomAppBarTheme.dark(scheme),
      segmentedButtonTheme: AppSegmentedButtonThemeData.dark(scheme),
      iconButtonTheme: AppIconButtonThemeData.dark(scheme),
    );
  }
}
