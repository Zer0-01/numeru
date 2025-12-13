import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/constant/constant.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/common_blocs/bloc/locale_bloc.dart';
import 'package:numeru/presentation/screen/settings/language/bloc/language_bloc.dart';

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
          BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              return TextButton(
                onPressed: () {
                  context.read<LocaleBloc>().add(
                    OnChangedLocaleEvent(locale: state.locale),
                  );
                },
                child: Text(
                  context.l10n.done,
                  style: TextStyle(color: context.colorScheme.primary),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return RadioGroup(
            groupValue: state.locale,
            onChanged: (value) {
              if (value == null) return;
              context.read<LanguageBloc>().add(
                OnSelectLocaleEvent(locale: value),
              );
            },
            child: ListView.builder(
              itemCount: LocaleEnum.values.length,
              itemBuilder: (context, index) {
                final LocaleEnum locale = LocaleEnum.values[index];
                return ListTile(
                  title: Text(locale.title),
                  trailing: Radio.adaptive(
                    value: locale.value,
                    activeColor: context.colorScheme.primary,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
