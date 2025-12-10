part of 'split_bloc.dart';

enum SplitStatus { initial, loading, success, failure }

class SplitState extends Equatable {
  final SplitStatus splitStatus;
  final List<PersonModel> persons;
  final bool isIncludeSst;
  final bool isHaveServiceCharge;
  final SummaryModel? summaryModel;

  const SplitState({
    this.splitStatus = SplitStatus.initial,
    this.persons = const [],
    this.isIncludeSst = false,
    this.isHaveServiceCharge = false,
    this.summaryModel,
  });

  SplitState copyWith({
    SplitStatus? splitStatus,
    List<PersonModel>? persons,
    bool? isIncludeSst,
    bool? isHaveServiceCharge,
    SummaryModel? summaryModel,
  }) {
    return SplitState(
      splitStatus: splitStatus ?? this.splitStatus,
      persons: persons ?? this.persons,
      isIncludeSst: isIncludeSst ?? this.isIncludeSst,
      isHaveServiceCharge: isHaveServiceCharge ?? this.isHaveServiceCharge,
      summaryModel: summaryModel ?? this.summaryModel,
    );
  }

  @override
  List<Object?> get props => [
    splitStatus,
    persons,
    isIncludeSst,
    isHaveServiceCharge,
    summaryModel,
  ];
}
