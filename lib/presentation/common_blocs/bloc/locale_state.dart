part of 'locale_bloc.dart';

enum LocaleStatus { initial, loading, success, error }

class LocaleState extends Equatable {
  final LocaleStatus status;
  final String locale;

  const LocaleState({required this.locale, this.status = LocaleStatus.initial});

  LocaleState copyWith({String? locale, LocaleStatus? status}) {
    return LocaleState(
      locale: locale ?? this.locale,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [locale, status];
}
