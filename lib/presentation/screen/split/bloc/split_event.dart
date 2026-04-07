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

class OnUpdateItemEvent extends SplitEvent {
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
  List<Object> get props => [
    id,
    name ?? '',
    price ?? 0.0,
    isTaxable ?? true,
  ];
}


class OnToggleItemTaxableEvent extends SplitEvent {
  final int id;
  final bool isTaxable;

  const OnToggleItemTaxableEvent({required this.id, required this.isTaxable});

  @override
  List<Object> get props => [id, isTaxable];
}

class OnUpdateSituationTypeEvent extends SplitEvent {
  final SituationType situationType;

  const OnUpdateSituationTypeEvent(this.situationType);

  @override
  List<Object> get props => [situationType];
}

class OnUpdateTaxValueEvent extends SplitEvent {
  final double taxPercentage;

  const OnUpdateTaxValueEvent(this.taxPercentage);

  @override
  List<Object> get props => [taxPercentage];
}

class OnUpdateServiceChargeRateEvent extends SplitEvent {
  final double serviceChargeRate;

  const OnUpdateServiceChargeRateEvent(this.serviceChargeRate);

  @override
  List<Object> get props => [serviceChargeRate];
}

class OnCalculateSplitEvent extends SplitEvent {
  const OnCalculateSplitEvent();

  @override
  List<Object> get props => [];
}

class OnResetSplitStatusEvent extends SplitEvent {
  const OnResetSplitStatusEvent();

  @override
  List<Object> get props => [];
}
