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
