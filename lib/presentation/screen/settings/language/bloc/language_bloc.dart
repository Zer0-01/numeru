import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final SharedPreferencesAsync asyncPrefs;
  LanguageBloc({required this.asyncPrefs, required String locale})
    : super(LanguageState(locale: locale)) {
    on<OnSelectLocaleEvent>(_onChangedLocale);
  }

  void _onChangedLocale(
    OnSelectLocaleEvent event,
    Emitter<LanguageState> emit,
  ) async {
    emit(state.copyWith(locale: event.locale));
  }
}
