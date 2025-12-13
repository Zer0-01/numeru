import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/service/app_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  final SharedPreferencesAsync asyncPrefs;

  LocaleBloc({required String locale, required this.asyncPrefs})
    : super(LocaleState(locale: locale)) {
    on<OnChangedLocaleEvent>(_onChangedLocale);
  }

  Future<void> _onChangedLocale(
    OnChangedLocaleEvent event,
    Emitter<LocaleState> emit,
  ) async {
    try {
      emit(state.copyWith(status: LocaleStatus.loading));
      await asyncPrefs.setString(AppPreferencesKey.locale.name, event.locale);
      emit(state.copyWith(status: LocaleStatus.success, locale: event.locale));
    } catch (e) {
      emit(state.copyWith(status: LocaleStatus.error));
    }
  }
}
