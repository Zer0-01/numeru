part of 'split_bloc.dart';

class SplitState extends Equatable {
  final List<PersonModel> persons;
  final bool isIncludeSst;
  final bool isHaveServiceCharge;
  final SummaryModel? summaryModel;

  const SplitState({
    this.persons = const [],
    this.isIncludeSst = false,
    this.isHaveServiceCharge = false,
    this.summaryModel,
  });

  SplitState copyWith({
    List<PersonModel>? persons,
    bool? isIncludeSst,
    bool? isHaveServiceCharge,
    SummaryModel? summaryModel,
  }) {
    return SplitState(
      persons: persons ?? this.persons,
      isIncludeSst: isIncludeSst ?? this.isIncludeSst,
      isHaveServiceCharge: isHaveServiceCharge ?? this.isHaveServiceCharge,
      summaryModel: summaryModel ?? this.summaryModel,
    );
  }

  @override
  List<Object?> get props => [
    persons,
    isIncludeSst,
    isHaveServiceCharge,
    summaryModel,
  ];
}
