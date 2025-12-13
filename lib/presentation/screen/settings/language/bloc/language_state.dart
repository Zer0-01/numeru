part of 'language_bloc.dart';

class LanguageState extends Equatable {
  final String locale;

  const LanguageState({required this.locale});

  LanguageState copyWith({String? locale}) {
    return LanguageState(locale: locale ?? this.locale);
  }

  @override
  List<Object> get props => [locale];
}
