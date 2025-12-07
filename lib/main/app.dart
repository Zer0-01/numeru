import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
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
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.teal,
          onPrimary: Colors.white,
          secondary: Colors.indigo,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.teal.shade50,
          onSurface: Colors.black,
          surfaceContainer: Colors.white,
          outline: Colors.black12,
        ),
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.teal,
          onPrimary: Colors.white,
          secondary: Colors.indigo,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.teal.shade900,
          onSurface: Colors.white,
          surfaceContainer: Colors.black,
          outline: Colors.white12,
        ),
      ),
      initial: AdaptiveThemeMode.light,
      debugShowFloatingThemeButton: true,
      builder:
          (light, dark) => MaterialApp.router(
            routerConfig: _appRouter.config(),
            theme: light,
            darkTheme: dark,
          ),
    );
  }
}
