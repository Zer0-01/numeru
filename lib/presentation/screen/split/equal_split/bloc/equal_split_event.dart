part of 'equal_split_bloc.dart';

sealed class EqualSplitEvent extends Equatable {
  const EqualSplitEvent();

  @override
  List<Object> get props => [];
}

class OnAddPeopleEvent extends EqualSplitEvent {
  const OnAddPeopleEvent();

  @override
  List<Object> get props => [];
}

class OnRemovePeopleEvent extends EqualSplitEvent {
  final int id;
  const OnRemovePeopleEvent(this.id);

  @override
  List<Object> get props => [id];
}

class OnAddItemEvent extends EqualSplitEvent {
  const OnAddItemEvent();
}

class OnRemoveItemEvent extends EqualSplitEvent {
  final int itemId;
  const OnRemoveItemEvent(this.itemId);

  @override
  List<Object> get props => [itemId];
}

class OnUpdateItemEvent extends EqualSplitEvent {
  final int id;
  final String? name;
  final double? price;
  final bool? isTaxable;

  const OnUpdateItemEvent({
    required this.id,
    this.name,
    this.price,
    this.isTaxable,
  });

  @override
  List<Object> get props => [id, name ?? '', price ?? 0.0, isTaxable ?? true];
}

class OnToggleItemTaxableEvent extends EqualSplitEvent {
  final int id;
  final bool isTaxable;

  const OnToggleItemTaxableEvent({required this.id, required this.isTaxable});

  @override
  List<Object> get props => [id, isTaxable];
}

class OnUpdateTaxValueEvent extends EqualSplitEvent {
  final double taxPercentage;

  const OnUpdateTaxValueEvent(this.taxPercentage);

  @override
  List<Object> get props => [taxPercentage];
}

class OnUpdateServiceChargeRateEvent extends EqualSplitEvent {
  final double serviceChargeRate;

  const OnUpdateServiceChargeRateEvent(this.serviceChargeRate);

  @override
  List<Object> get props => [serviceChargeRate];
}

class OnCalculateSplitEvent extends EqualSplitEvent {
  const OnCalculateSplitEvent();

  @override
  List<Object> get props => [];
}

class OnResetSplitStatusEvent extends EqualSplitEvent {
  const OnResetSplitStatusEvent();

  @override
  List<Object> get props => [];
}
