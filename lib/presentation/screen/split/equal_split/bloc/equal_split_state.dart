part of 'equal_split_bloc.dart';

enum SplitStatus { initial, loading, success, failure }

class EqualSplitState extends Equatable {
  final SplitStatus splitStatus;
  final List<PersonModel> peopleModel;
  final List<ItemModel> itemsModel;
  final double taxPercentage;
  final double serviceChargeRate;
  final SplitSummaryModel? summaryModel;

  const EqualSplitState({
    this.splitStatus = SplitStatus.initial,
    this.peopleModel = const [],
    this.itemsModel = const [],
    this.taxPercentage = 6,
    this.serviceChargeRate = 10.0,
    this.summaryModel,
  });

  EqualSplitState copyWith({
    SplitStatus? splitStatus,
    List<PersonModel>? peopleModel,
    List<ItemModel>? itemsModel,
    double? taxPercentage,
    double? serviceChargeRate,
    SplitSummaryModel? summaryModel,
    bool clearSummary = false,
  }) {
    return EqualSplitState(
      splitStatus: splitStatus ?? this.splitStatus,
      peopleModel: peopleModel ?? this.peopleModel,
      itemsModel: itemsModel ?? this.itemsModel,
      taxPercentage: taxPercentage ?? this.taxPercentage,
      serviceChargeRate: serviceChargeRate ?? this.serviceChargeRate,
      summaryModel: clearSummary ? null : (summaryModel ?? this.summaryModel),
    );
  }

  @override
  List<Object?> get props => [
    splitStatus,
    peopleModel,
    itemsModel,
    taxPercentage,
    serviceChargeRate,
    summaryModel,
  ];
}
