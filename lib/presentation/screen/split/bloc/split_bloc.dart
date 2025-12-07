import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:numeru/data/models/person_model.dart';
import 'package:numeru/data/models/summary_model.dart';

part 'split_event.dart';
part 'split_state.dart';

class SplitBloc extends Bloc<SplitEvent, SplitState> {
  SplitBloc() : super(SplitState()) {
    on<OnAddPersonEvent>(_onAddPersonEvent);
    on<OnAddFoodEvent>(_onAddFoodEvent);
    on<OnChangedIncludeSstEvent>(_onChangedIncludeSstEvent);
    on<OnChangedHaveServiceChargeEvent>(_onChangedHaveServiceChargeEvent);
    on<OnPressedSummaryEvent>(_onPressedSummaryEvent);
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

  void _onChangedIncludeSstEvent(
    OnChangedIncludeSstEvent event,
    Emitter<SplitState> emit,
  ) {
    emit(state.copyWith(isIncludeSst: !state.isIncludeSst));
  }

  void _onChangedHaveServiceChargeEvent(
    OnChangedHaveServiceChargeEvent event,
    Emitter<SplitState> emit,
  ) {
    emit(state.copyWith(isHaveServiceCharge: !state.isHaveServiceCharge));
  }

  void _onPressedSummaryEvent(
    OnPressedSummaryEvent event,
    Emitter<SplitState> emit,
  ) {
    debugPrint("Oi");
    final service =
        state.isHaveServiceCharge
            ? event.serviceCharge / state.persons.length
            : 0;
    final List<SummaryPerson> summary = [];
    for (var p in state.persons) {
      double total = 0;
      for (var f in p.foods) {
        if (state.isIncludeSst) {
          total += f.price;
        } else {
          total += ((f.price + 0.06) + f.price);
        }
      }

      if (state.isHaveServiceCharge) {
        total += service;
      }

      debugPrint(total.toString());

      final SummaryPerson summaryPerson = SummaryPerson(
        id: p.id,
        name: p.name,
        total: total,
      );

      summary.add(summaryPerson);
    }

    final SummaryModel summaryModel = SummaryModel(
      persons: state.persons.length,
      total: event.totalBill,
      summary: summary,
      serviceCharge: event.serviceCharge,
    );

    emit(state.copyWith(summaryModel: summaryModel));
  }
}
