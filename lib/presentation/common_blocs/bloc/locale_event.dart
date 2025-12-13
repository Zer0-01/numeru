part of 'locale_bloc.dart';

sealed class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object> get props => [];
}

class OnChangedLocaleEvent extends LocaleEvent {
  final String locale;
  const OnChangedLocaleEvent({required this.locale});

  @override
  List<Object> get props => [locale];
}
