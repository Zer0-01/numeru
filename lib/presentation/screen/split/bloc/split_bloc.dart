import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:numeru/config/app_logger.dart';
import 'package:numeru/data/models/item_model.dart';
import 'package:numeru/data/models/person_model.dart';

import 'package:numeru/data/models/split_summary_model.dart';

part 'split_event.dart';
part 'split_state.dart';

class SplitBloc extends Bloc<SplitEvent, SplitState> {
  final AppLogger _logger = AppLogger.getLogger('SplitBloc');

  SplitBloc() : super(const SplitState()) {
    on<OnAddPeopleEvent>(_onAddPeopleEvent);
    on<OnRemovePeopleEvent>(_onRemovePeopleEvent);
    on<OnAddItemEvent>(_onAddItemEvent);
    on<OnRemoveItemEvent>(_onRemoveItemEvent);
    on<OnUpdateItemEvent>(_onUpdateItemEvent);
    on<OnToggleItemPersonEvent>(_onToggleItemPersonEvent);
    on<OnToggleAllItemPersonsEvent>(_onToggleAllItemPersonsEvent);
    on<OnToggleTaxIncludedEvent>(_onToggleTaxIncludedEvent);
    on<OnUpdateTaxValueEvent>(_onUpdateTaxValueEvent);
    on<OnCalculateSplitEvent>(_onCalculateSplitEvent);
  }

  void _onAddPeopleEvent(OnAddPeopleEvent event, Emitter<SplitState> emit) {
    _logger.debug("OnAddPeopleEvent");
    final nextId =
        state.peopleModel.isEmpty
            ? 1
            : state.peopleModel
                    .map((e) => e.id)
                    .reduce((a, b) => a > b ? a : b) +
                1;

    final PersonModel person = PersonModel(id: nextId, name: "Person $nextId");

    emit(state.copyWith(peopleModel: [...state.peopleModel, person]));
  }

  void _onAddItemEvent(OnAddItemEvent event, Emitter<SplitState> emit) {
    _logger.debug("OnAddItemEvent");
    final nextId =
        state.itemsModel.isEmpty
            ? 1
            : state.itemsModel
                    .map((e) => e.id)
                    .reduce((a, b) => a > b ? a : b) +
                1;

    final updatedItems = List<ItemModel>.from(state.itemsModel);
    updatedItems.add(ItemModel(id: nextId, name: '', price: 0, personIds: []));

    emit(state.copyWith(itemsModel: updatedItems));
  }

  void _onRemoveItemEvent(OnRemoveItemEvent event, Emitter<SplitState> emit) {
    _logger.debug("OnRemoveItemEvent: ${event.itemId}");
    final updatedItems =
        state.itemsModel.where((item) => item.id != event.itemId).toList();

    emit(state.copyWith(itemsModel: updatedItems));
  }

  void _onUpdateItemEvent(OnUpdateItemEvent event, Emitter<SplitState> emit) {
    _logger.debug("OnUpdateItemEvent: ${event.id}");
    final updatedItems =
        state.itemsModel.map((item) {
          if (item.id == event.id) {
            return item.copyWith(name: event.name, price: event.price);
          }
          return item;
        }).toList();

    emit(state.copyWith(itemsModel: updatedItems));
  }

  void _onToggleItemPersonEvent(
    OnToggleItemPersonEvent event,
    Emitter<SplitState> emit,
  ) {
    _logger.debug(
      "OnToggleItemPersonEvent: item ${event.itemId}, person ${event.personId}",
    );
    final updatedItems =
        state.itemsModel.map((item) {
          if (item.id == event.itemId) {
            final updatedPersonIds = List<int>.from(item.personIds);
            if (updatedPersonIds.contains(event.personId)) {
              updatedPersonIds.remove(event.personId);
            } else {
              updatedPersonIds.add(event.personId);
            }
            return item.copyWith(personIds: updatedPersonIds);
          }
          return item;
        }).toList();

    emit(state.copyWith(itemsModel: updatedItems));
  }

  void _onToggleAllItemPersonsEvent(
    OnToggleAllItemPersonsEvent event,
    Emitter<SplitState> emit,
  ) {
    _logger.debug(
      "OnToggleAllItemPersonsEvent: item ${event.itemId}, isShared ${event.isShared}",
    );
    final updatedItems =
        state.itemsModel.map((item) {
          if (item.id == event.itemId) {
            final updatedPersonIds =
                event.isShared
                    ? state.peopleModel.map((e) => e.id).toList()
                    : <int>[];
            return item.copyWith(personIds: updatedPersonIds);
          }
          return item;
        }).toList();

    emit(state.copyWith(itemsModel: updatedItems));
  }

  void _onRemovePeopleEvent(
    OnRemovePeopleEvent event,
    Emitter<SplitState> emit,
  ) {
    _logger.debug("OnRemovePeopleEvent: ${event.id}");
    final updatedPeople =
        state.peopleModel.where((p) => p.id != event.id).toList();
    emit(state.copyWith(peopleModel: updatedPeople));
  }

  void _onToggleTaxIncludedEvent(
    OnToggleTaxIncludedEvent event,
    Emitter<SplitState> emit,
  ) {
    _logger.debug("OnToggleTaxIncludedEvent: ${event.isTaxIncluded}");
    emit(state.copyWith(isTaxIncluded: event.isTaxIncluded));
  }

  void _onUpdateTaxValueEvent(
    OnUpdateTaxValueEvent event,
    Emitter<SplitState> emit,
  ) {
    _logger.debug("OnUpdateTaxValueEvent: ${event.taxPercentage}");
    emit(state.copyWith(taxPercentage: event.taxPercentage));
  }

  void _onCalculateSplitEvent(
    OnCalculateSplitEvent event,
    Emitter<SplitState> emit,
  ) {
    _logger.debug("OnCalculateSplitEvent");

    // 1. Calculate Subtotal
    final double subtotal = state.itemsModel.fold(
      0,
      (sum, item) => sum + item.price,
    );

    // 2. Calculate Tax
    double taxAmount = 0;
    if (state.isTaxIncluded) {
      taxAmount = subtotal - (subtotal / (1 + state.taxPercentage / 100));
    } else {
      taxAmount = subtotal * (state.taxPercentage / 100);
    }

    // 3. Calculate Total
    final double totalBeforeRounding =
        state.isTaxIncluded ? subtotal : (subtotal + taxAmount);
    final double totalAmount = totalBeforeRounding.roundToDouble();
    final double roundingAmount = totalAmount - totalBeforeRounding;

    // 4. Calculate Person Breakdown
    final Map<int, double> personSubtotals = {};
    final Map<int, List<String>> personItems = {};

    for (var person in state.peopleModel) {
      personSubtotals[person.id] = 0;
      personItems[person.id] = [];
    }

    for (var item in state.itemsModel) {
      if (item.personIds.isEmpty) continue;

      final double share = item.price / item.personIds.length;
      for (var personId in item.personIds) {
        if (personSubtotals.containsKey(personId)) {
          personSubtotals[personId] = (personSubtotals[personId] ?? 0) + share;
          personItems[personId]?.add(
            item.name.isEmpty ? "Unnamed Item" : item.name,
          );
        }
      }
    }

    // Pro-rata total adjustment (multiplier)
    // Avoid division by zero if subtotal is 0
    final double multiplier = subtotal > 0 ? totalAmount / subtotal : 0;

    final List<PersonSummaryModel> personSummaries =
        state.peopleModel.map((person) {
          final double personBase = personSubtotals[person.id] ?? 0;
          return PersonSummaryModel(
            id: person.id,
            name: person.name,
            totalAmount: personBase * multiplier,
            itemNames: personItems[person.id] ?? [],
          );
        }).toList();

    final summary = SplitSummaryModel(
      subtotal: subtotal,
      taxAmount: taxAmount,
      taxPercentage: state.taxPercentage,
      totalAmount: totalAmount,
      roundingAmount: roundingAmount,
      personSummaries: personSummaries,
    );

    emit(state.copyWith(summaryModel: summary));
  }
}
