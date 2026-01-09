import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/router/app_router.gr.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.router.maybePop(),
          icon: const Icon(Icons.chevron_left),
        ),
        title: Text(context.l10n.settings),
        backgroundColor: context.colorScheme.surface,
        foregroundColor: context.colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: context.colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.language, color: context.colorScheme.onPrimary),
            ),
            title: Text(context.l10n.language),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.router.push(const LanguageSetupRoute()),
          ),
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: context.colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.color_lens,
                color: context.colorScheme.onPrimary,
              ),
            ),
            title: Text(context.l10n.dark_mode),
            trailing: Switch.adaptive(
              value: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark,
              onChanged: (isDark) {
                if (isDark) {
                  AdaptiveTheme.of(context).setDark();
                } else {
                  AdaptiveTheme.of(context).setLight();
                }
              },
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
