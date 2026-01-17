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

class OnAddItemEvent extends SplitEvent {
  const OnAddItemEvent();

  @override
  List<Object> get props => [];
}
