part of 'split_bloc.dart';

enum SplitStatus { initial, loading, success, failure }

class SplitState extends Equatable {
  final SplitStatus splitStatus;
  final List<PersonModel> peopleModel;
  final List<ItemModel> itemsModel;
  final String taxMode; // INCLUSIVE | EXCLUSIVE
  final double taxPercentage;
  final double serviceChargeRate;
  final SplitSummaryModel? summaryModel;

  const SplitState({
    this.splitStatus = SplitStatus.initial,
    this.peopleModel = const [],
    this.itemsModel = const [],
    this.taxMode = "INCLUSIVE",
    this.taxPercentage = 6,
    this.serviceChargeRate = 0.10,
    this.summaryModel,
  });

  SplitState copyWith({
    SplitStatus? splitStatus,
    List<PersonModel>? peopleModel,
    List<ItemModel>? itemsModel,
    String? taxMode,
    double? taxPercentage,
    double? serviceChargeRate,
    SplitSummaryModel? summaryModel,
    bool clearSummary = false,
  }) {
    return SplitState(
      splitStatus: splitStatus ?? this.splitStatus,
      peopleModel: peopleModel ?? this.peopleModel,
      itemsModel: itemsModel ?? this.itemsModel,
      taxMode: taxMode ?? this.taxMode,
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
    taxMode,
    taxPercentage,
    serviceChargeRate,
    summaryModel,
  ];
}
