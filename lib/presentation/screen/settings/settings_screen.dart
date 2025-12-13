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
          icon: Icon(Icons.chevron_left),
        ),
        title: Text(context.l10n.settings),
        backgroundColor: context.colorScheme.surface,
        foregroundColor: context.colorScheme.onSurface,
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
            trailing: Icon(Icons.chevron_right),
            onTap: () => context.router.push(LanguageSetupRoute()),
          ),
        ],
      ),
    );
  }
}
