part of 'split_bloc.dart';

class SplitState extends Equatable {
  final List<PersonModel> persons;

  const SplitState({this.persons = const []});

  SplitState copyWith({List<PersonModel>? persons}) {
    return SplitState(persons: persons ?? this.persons);
  }

  @override
  List<Object> get props => [persons];
}
