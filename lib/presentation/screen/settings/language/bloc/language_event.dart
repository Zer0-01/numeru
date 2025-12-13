part of 'language_bloc.dart';

sealed class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class OnSelectLocaleEvent extends LanguageEvent {
  final String locale;
  const OnSelectLocaleEvent({required this.locale});

  @override
  List<Object> get props => [locale];
}
