import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeru/l10n/app_localizations.dart';
import 'package:numeru/presentation/common_blocs/bloc/locale_bloc.dart';
import 'package:numeru/router/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  final String locale;
  final _appRouter = AppRouter();

  App({super.key, required this.locale});

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
        fontFamily: GoogleFonts.sourceSans3().fontFamily,

        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.pink.shade800,
          onPrimary: Colors.white,
          secondary: Colors.indigo,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.grey.shade900,
          onSurface: Colors.white,
          surfaceContainer: Colors.grey,
          surfaceContainerLowest: Colors.black,
          surfaceContainerLow: Colors.grey.shade700,
          surfaceContainerHigh: Colors.grey.shade200,
          surfaceContainerHighest: Colors.white,
          outline: Colors.grey,
        ),
      ),
      initial: AdaptiveThemeMode.light,
      debugShowFloatingThemeButton: true,
      builder:
          (light, dark) => BlocProvider(
            create:
                (context) => LocaleBloc(
                  locale: locale,
                  asyncPrefs: SharedPreferencesAsync(),
                ),
            child: BlocBuilder<LocaleBloc, LocaleState>(
              builder: (context, state) {
                return MaterialApp.router(
                  routerConfig: _appRouter.config(),
                  theme: light,
                  darkTheme: dark,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  locale: Locale(state.locale),
                );
              },
            ),
          ),
    );
  }
}
