import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:numeru/constant/constant.dart';
import 'package:numeru/extensions/context_extension.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.router.maybePop(),
          icon: Icon(Icons.chevron_left),
        ),
        title: Text(context.l10n.language),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              context.l10n.done,
              style: TextStyle(color: context.colorScheme.primary),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: LocaleEnum.values.length,
        itemBuilder: (context, index) {
          final LocaleEnum locale = LocaleEnum.values[index];
          return ListTile(
            title: Text(locale.title),
            trailing: Radio.adaptive(value: locale.value),
          );
        },
      ),
    );
  }
}
