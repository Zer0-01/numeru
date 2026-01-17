part of 'split_bloc.dart';

enum SplitStatus { initial, loading, success, failure }

class SplitState extends Equatable {
  final SplitStatus splitStatus;
  final List<PersonModel> peopleModel;
  final List<ItemModel> itemsModel;

  const SplitState({
    this.splitStatus = SplitStatus.initial,
    this.peopleModel = const [],
    this.itemsModel = const [],
  });

  SplitState copyWith({
    SplitStatus? splitStatus,
    List<PersonModel>? peopleModel,
    List<ItemModel>? itemsModel,
  }) {
    return SplitState(
      splitStatus: splitStatus ?? this.splitStatus,
      peopleModel: peopleModel ?? this.peopleModel,
      itemsModel: itemsModel ?? this.itemsModel,
    );
  }

  @override
  List<Object?> get props => [splitStatus, peopleModel, itemsModel];
}
