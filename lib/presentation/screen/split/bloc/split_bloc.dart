import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:numeru/data/models/person_model.dart';

part 'split_event.dart';
part 'split_state.dart';

class SplitBloc extends Bloc<SplitEvent, SplitState> {
  SplitBloc() : super(SplitState()) {
    on<OnAddPersonEvent>(_onAddPersonEvent);
    on<OnAddFoodEvent>(_onAddFoodEvent);
  }

  void _onAddPersonEvent(OnAddPersonEvent event, Emitter<SplitState> emit) {
    final PersonModel person = PersonModel(
      id: state.persons.length + 1,
      name:
          event.name.isNotEmpty
              ? event.name
              : (state.persons.length + 1).toString(),
      foods: [],
    );

    emit(state.copyWith(persons: [...state.persons, person]));
  }

  void _onAddFoodEvent(OnAddFoodEvent event, Emitter<SplitState> emit) {
    final updatedPersons =
        state.persons.map((person) {
          if (person.id == event.personId) {
            final updatedFoods = [
              ...person.foods,
              PersonFood(
                id: person.foods.length + 1,
                name: event.name,
                quantity: event.quantity,
                price: event.cost,
              ),
            ];
            return PersonModel(
              id: person.id,
              name: person.name,
              foods: updatedFoods,
            );
          }
          return person;
        }).toList();

    emit(state.copyWith(persons: updatedPersons));
  }
}
