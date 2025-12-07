part of 'split_bloc.dart';

sealed class SplitEvent extends Equatable {
  const SplitEvent();

  @override
  List<Object> get props => [];
}

class OnAddPersonEvent extends SplitEvent {
  final String name;

  const OnAddPersonEvent({required this.name});

  @override
  List<Object> get props => [name];
}

class OnAddFoodEvent extends SplitEvent {
  final int personId;
  final String name;
  final double cost;
  final int quantity;

  const OnAddFoodEvent({
    required this.personId,
    required this.name,
    required this.cost,
    required this.quantity,
  });

  @override
  List<Object> get props => [personId, name, cost, quantity];
}
