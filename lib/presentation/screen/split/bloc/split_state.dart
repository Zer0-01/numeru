part of 'split_bloc.dart';

class SplitState extends Equatable {
  final List<PersonModel> persons;
  final bool isIncludeSst;
  final bool isHaveServiceCharge;

  const SplitState({
    this.persons = const [],
    this.isIncludeSst = false,
    this.isHaveServiceCharge = false,
  });

  SplitState copyWith({
    List<PersonModel>? persons,
    bool? isIncludeSst,
    bool? isHaveServiceCharge,
  }) {
    return SplitState(
      persons: persons ?? this.persons,
      isIncludeSst: isIncludeSst ?? this.isIncludeSst,
      isHaveServiceCharge: isHaveServiceCharge ?? this.isHaveServiceCharge,
    );
  }

  @override
  List<Object> get props => [persons, isIncludeSst, isHaveServiceCharge];
}
