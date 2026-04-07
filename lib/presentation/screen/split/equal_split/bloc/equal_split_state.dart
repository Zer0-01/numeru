part of 'equal_split_bloc.dart';


enum SplitStatus { initial, loading, success, failure }

class EqualSplitState extends Equatable {
  final SplitStatus splitStatus;
  final int numberOfPeople;
  final List<ItemModel> itemsModel;
  final double taxPercentage;
  final double serviceChargeRate;
  final EqualSplitSummaryModel? summaryModel;

  const EqualSplitState({
    this.splitStatus = SplitStatus.initial,
    this.numberOfPeople = 1,
    this.itemsModel = const [],
    this.taxPercentage = 6,
    this.serviceChargeRate = 10.0,
    this.summaryModel,
  });

  EqualSplitState copyWith({
    SplitStatus? splitStatus,
    int? numberOfPeople,
    List<ItemModel>? itemsModel,
    double? taxPercentage,
    double? serviceChargeRate,
    EqualSplitSummaryModel? summaryModel,
    bool clearSummary = false,
  }) {
    return EqualSplitState(
      splitStatus: splitStatus ?? this.splitStatus,
      numberOfPeople: numberOfPeople ?? this.numberOfPeople,
      itemsModel: itemsModel ?? this.itemsModel,
      taxPercentage: taxPercentage ?? this.taxPercentage,
      serviceChargeRate: serviceChargeRate ?? this.serviceChargeRate,
      summaryModel: clearSummary ? null : (summaryModel ?? this.summaryModel),
    );
  }

  @override
  List<Object?> get props => [
    splitStatus,
    numberOfPeople,
    itemsModel,
    taxPercentage,
    serviceChargeRate,
    summaryModel,
  ];
}
