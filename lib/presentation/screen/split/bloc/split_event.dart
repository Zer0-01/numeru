part of 'split_bloc.dart';

sealed class SplitEvent extends Equatable {
  const SplitEvent();

  @override
  List<Object> get props => [];
}

class OnAddPeopleEvent extends SplitEvent {
  const OnAddPeopleEvent();

  @override
  List<Object> get props => [];
}

class OnRemovePeopleEvent extends SplitEvent {
  final int id;
  const OnRemovePeopleEvent(this.id);

  @override
  List<Object> get props => [id];
}

class OnAddItemEvent extends SplitEvent {
  const OnAddItemEvent();
}

class OnRemoveItemEvent extends SplitEvent {
  final int itemId;
  const OnRemoveItemEvent(this.itemId);

  @override
  List<Object> get props => [itemId];
}

class OnUpdateItemEvent extends SplitEvent {
  final int id;
  final String? name;
  final double? price;

  const OnUpdateItemEvent({required this.id, this.name, this.price});

  @override
  List<Object> get props => [id, name ?? '', price ?? 0.0];
}

class OnToggleItemPersonEvent extends SplitEvent {
  final int itemId;
  final int personId;

  const OnToggleItemPersonEvent({required this.itemId, required this.personId});

  @override
  List<Object> get props => [itemId, personId];
}

class OnToggleAllItemPersonsEvent extends SplitEvent {
  final int itemId;
  final bool isShared;

  const OnToggleAllItemPersonsEvent({
    required this.itemId,
    required this.isShared,
  });

  @override
  List<Object> get props => [itemId, isShared];
}

class OnToggleTaxIncludedEvent extends SplitEvent {
  final bool isTaxIncluded;

  const OnToggleTaxIncludedEvent(this.isTaxIncluded);

  @override
  List<Object> get props => [isTaxIncluded];
}

class OnUpdateTaxValueEvent extends SplitEvent {
  final double taxPercentage;

  const OnUpdateTaxValueEvent(this.taxPercentage);

  @override
  List<Object> get props => [taxPercentage];
}

class OnCalculateSplitEvent extends SplitEvent {
  const OnCalculateSplitEvent();

  @override
  List<Object> get props => [];
}
