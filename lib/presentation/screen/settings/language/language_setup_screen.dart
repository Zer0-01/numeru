import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/presentation/common_blocs/bloc/locale_bloc.dart';
import 'package:numeru/presentation/screen/settings/language/bloc/language_bloc.dart';
import 'package:numeru/presentation/screen/settings/language/language_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class LanguageSetupScreen extends StatelessWidget {
  const LanguageSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, state) {
        return BlocProvider(
          create:
              (context) => LanguageBloc(
                asyncPrefs: SharedPreferencesAsync(),
                locale: state.locale,
              ),
          child: BlocListener<LocaleBloc, LocaleState>(
            listenWhen:
                (previous, current) => previous.status != current.status,
            listener: (context, state) {
              if (state.status == LocaleStatus.success) {
                context.router.maybePop();
              }
            },
            child: const LanguageScreen(),
          ),
        );
      },
    );
  }
}
