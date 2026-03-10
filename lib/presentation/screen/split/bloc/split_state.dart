part of 'split_bloc.dart';

enum SplitStatus { initial, loading, success, failure }

class SplitState extends Equatable {
  final SplitStatus splitStatus;
  final List<PersonModel> peopleModel;
  final List<ItemModel> itemsModel;
  final bool isTaxIncluded;
  final double taxPercentage;
  final SplitSummaryModel? summaryModel;

  const SplitState({
    this.splitStatus = SplitStatus.initial,
    this.peopleModel = const [],
    this.itemsModel = const [],
    this.isTaxIncluded = true,
    this.taxPercentage = 10,
    this.summaryModel,
  });

  SplitState copyWith({
    SplitStatus? splitStatus,
    List<PersonModel>? peopleModel,
    List<ItemModel>? itemsModel,
    bool? isTaxIncluded,
    double? taxPercentage,
    SplitSummaryModel? summaryModel,
  }) {
    return SplitState(
      splitStatus: splitStatus ?? this.splitStatus,
      peopleModel: peopleModel ?? this.peopleModel,
      itemsModel: itemsModel ?? this.itemsModel,
      isTaxIncluded: isTaxIncluded ?? this.isTaxIncluded,
      taxPercentage: taxPercentage ?? this.taxPercentage,
      summaryModel: summaryModel ?? this.summaryModel,
    );
  }

  @override
  List<Object?> get props => [
    splitStatus,
    peopleModel,
    itemsModel,
    isTaxIncluded,
    taxPercentage,
    summaryModel,
  ];
}
