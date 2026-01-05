import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/l10n/app_localizations.dart';
import 'package:numeru/presentation/common_blocs/bloc/locale_bloc.dart';
import 'package:numeru/router/app_router.dart';
import 'package:numeru/theme/app_theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  final String locale;
  final _appRouter = AppRouter();

  App({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppThemeData.light(),
      dark: AppThemeData.dark(),
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
                  debugShowCheckedModeBanner: false,
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
