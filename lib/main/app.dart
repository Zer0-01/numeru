import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeru/l10n/app_localizations.dart';
import 'package:numeru/router/app_router.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: GoogleFonts.sourceSans3().fontFamily,
        colorScheme: ColorScheme(
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
          surfaceContainer: Colors.grey,
          surfaceContainerLowest: Colors.white,
          surfaceContainerLow: Colors.grey.shade200,
          surfaceContainerHigh: Colors.grey.shade700,
          surfaceContainerHighest: Colors.black,
          surface: Colors.grey.shade100,
          onSurface: Colors.black,
        ),
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xffF1F3E0),
          onPrimary: Color(0xff778873),
          secondary: Colors.indigo,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Color(0xff778873),
          onSurface: Colors.white,
          surfaceContainer: Colors.black,
          surfaceContainerLowest: Colors.grey.shade900,
          surfaceContainerLow: Colors.grey.shade800,
          surfaceContainerHigh: Colors.grey.shade700,
          surfaceContainerHighest: Colors.grey.shade600,
          outline: Colors.grey,
        ),
      ),
      initial: AdaptiveThemeMode.light,
      debugShowFloatingThemeButton: true,
      builder:
          (light, dark) => MaterialApp.router(
            routerConfig: _appRouter.config(),
            theme: light,
            darkTheme: dark,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          ),
    );
  }
}
