part of 'split_bloc.dart';

class SplitState extends Equatable {
  final List<PersonModel> persons;
  final bool isIncludeSst;
  final bool isHaveServiceCharge;
  final SummaryModel? summaryModel;
  final bool isHaveRounding;
  final RoundingTypeEnum roundingType;

  const SplitState({
    this.persons = const [],
    this.isIncludeSst = false,
    this.isHaveServiceCharge = false,
    this.summaryModel,
    this.isHaveRounding = false,
    this.roundingType = RoundingTypeEnum.up,
  });

  SplitState copyWith({
    List<PersonModel>? persons,
    bool? isIncludeSst,
    bool? isHaveServiceCharge,
    SummaryModel? summaryModel,
    bool? isHaveRounding,
    RoundingTypeEnum? roundingType,
  }) {
    return SplitState(
      persons: persons ?? this.persons,
      isIncludeSst: isIncludeSst ?? this.isIncludeSst,
      isHaveServiceCharge: isHaveServiceCharge ?? this.isHaveServiceCharge,
      summaryModel: summaryModel ?? this.summaryModel,
      isHaveRounding: isHaveRounding ?? this.isHaveRounding,
      roundingType: roundingType ?? this.roundingType,
    );
  }

  @override
  List<Object?> get props => [
    persons,
    isIncludeSst,
    isHaveServiceCharge,
    summaryModel,
    isHaveRounding,
    roundingType,
  ];
}
