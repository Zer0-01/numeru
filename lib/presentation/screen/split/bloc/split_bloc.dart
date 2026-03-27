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
    on<OnUpdateItemQuantityEvent>(_onUpdateItemQuantityEvent);
    on<OnToggleItemTaxableEvent>(_onToggleItemTaxableEvent);
    on<OnToggleItemPersonEvent>(_onToggleItemPersonEvent);
    on<OnToggleAllItemPersonsEvent>(_onToggleAllItemPersonsEvent);
    on<OnUpdateTaxModeEvent>(_onUpdateTaxModeEvent);
    on<OnUpdateTaxValueEvent>(_onUpdateTaxValueEvent);
    on<OnUpdateServiceChargeRateEvent>(_onUpdateServiceChargeRateEvent);
    on<OnCalculateSplitEvent>(_onCalculateSplitEvent);
    on<OnResetSplitStatusEvent>(_onResetSplitStatusEvent);
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
    updatedItems.add(
      ItemModel(id: nextId, name: '', price: 0, personIds: []),
    );

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
            return item.copyWith(
              name: event.name,
              price: event.price,
              quantity: event.quantity,
              isTaxable: event.isTaxable,
            );
          }
          return item;
        }).toList();

    emit(state.copyWith(itemsModel: updatedItems));
  }

  void _onUpdateItemQuantityEvent(
    OnUpdateItemQuantityEvent event,
    Emitter<SplitState> emit,
  ) {
    _logger.debug("OnUpdateItemQuantityEvent: ${event.id}");
    final updatedItems =
        state.itemsModel.map((item) {
          if (item.id == event.id) {
            return item.copyWith(quantity: event.quantity);
          }
          return item;
        }).toList();

    emit(state.copyWith(itemsModel: updatedItems));
  }

  void _onToggleItemTaxableEvent(
    OnToggleItemTaxableEvent event,
    Emitter<SplitState> emit,
  ) {
    _logger.debug("OnToggleItemTaxableEvent: ${event.id}");
    final updatedItems =
        state.itemsModel.map((item) {
          if (item.id == event.id) {
            return item.copyWith(isTaxable: event.isTaxable);
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

  void _onUpdateTaxModeEvent(
    OnUpdateTaxModeEvent event,
    Emitter<SplitState> emit,
  ) {
    _logger.debug("OnUpdateTaxModeEvent: ${event.taxMode}");
    emit(state.copyWith(taxMode: event.taxMode));
  }

  void _onUpdateTaxValueEvent(
    OnUpdateTaxValueEvent event,
    Emitter<SplitState> emit,
  ) {
    _logger.debug("OnUpdateTaxValueEvent: ${event.taxPercentage}");
    emit(state.copyWith(taxPercentage: event.taxPercentage));
  }

  void _onUpdateServiceChargeRateEvent(
    OnUpdateServiceChargeRateEvent event,
    Emitter<SplitState> emit,
  ) {
    _logger.debug("OnUpdateServiceChargeRateEvent: ${event.serviceChargeRate}");
    emit(state.copyWith(serviceChargeRate: event.serviceChargeRate));
  }

  void _onCalculateSplitEvent(
    OnCalculateSplitEvent event,
    Emitter<SplitState> emit,
  ) {
    _logger.debug("OnCalculateSplitEvent");
    emit(state.copyWith(splitStatus: SplitStatus.loading));

    final double taxRate = state.taxPercentage / 100;
    final double serviceChargeRate = state.serviceChargeRate / 100;
    final bool isInclusive = state.taxMode == "INCLUSIVE";

    // 1. Calculate Subtotal and Tax Portions
    double subtotal = 0;
    double taxableAmount = 0;
    double includedTaxAmount = 0;

    for (var item in state.itemsModel) {
      final double itemTotal = item.price * item.quantity;
      subtotal += itemTotal;
      if (item.isTaxable) {
        taxableAmount += itemTotal;
        if (isInclusive) {
          final double basePrice = item.price / (1 + taxRate);
          includedTaxAmount += (item.price - basePrice) * item.quantity;
        }
      }
    }

    // 2. Calculate Tax and Service Charge
    double taxAmount = 0;
    if (isInclusive) {
      taxAmount = includedTaxAmount;
    } else {
      taxAmount = taxableAmount * taxRate;
    }

    final double serviceChargeAmount = subtotal * serviceChargeRate;

    // 3. Final Total
    final double finalTotalRaw =
        isInclusive
            ? (subtotal + serviceChargeAmount)
            : (subtotal + serviceChargeAmount + taxAmount);
    final double finalTotal = (finalTotalRaw * 100).round() / 100;
    final double roundingAmount = finalTotal - finalTotalRaw;

    // 4. Calculate Person Breakdown
    final Map<int, double> personBaseShares = {};
    final Map<int, double> personTaxableShares = {};
    final Map<int, List<String>> personItems = {};

    for (var person in state.peopleModel) {
      personBaseShares[person.id] = 0;
      personTaxableShares[person.id] = 0;
      personItems[person.id] = [];
    }

    for (var item in state.itemsModel) {
      if (item.personIds.isEmpty) continue;

      final double share = (item.price * item.quantity) / item.personIds.length;
      for (var personId in item.personIds) {
        if (personBaseShares.containsKey(personId)) {
          personBaseShares[personId] = (personBaseShares[personId] ?? 0) + share;
          if (item.isTaxable) {
            personTaxableShares[personId] =
                (personTaxableShares[personId] ?? 0) + share;
          }
          personItems[personId]?.add(
            item.name.isEmpty ? "Unnamed Item" : item.name,
          );
        }
      }
    }

    // Calculate individual totals
    double runningSplitTotal = 0;
    final List<PersonSummaryModel> personSummaries = [];

    for (int i = 0; i < state.peopleModel.length; i++) {
      final person = state.peopleModel[i];
      final double baseShare = personBaseShares[person.id] ?? 0;
      final double taxableShare = personTaxableShares[person.id] ?? 0;

      double personTax = 0;
      if (isInclusive) {
        // In inclusive mode, tax is already in baseShare
        personTax = 0; // Display portion not added
      } else {
        personTax = taxableShare * taxRate;
      }

      final double personServiceCharge = baseShare * serviceChargeRate;
      double personTotal =
          isInclusive
              ? (baseShare + personServiceCharge)
              : (baseShare + personServiceCharge + personTax);

      // Rounding adjustment on the last person
      if (i == state.peopleModel.length - 1) {
        personTotal = finalTotal - runningSplitTotal;
      } else {
        personTotal = (personTotal * 100).round() / 100;
        runningSplitTotal += personTotal;
      }

      personSummaries.add(
        PersonSummaryModel(
          id: person.id,
          name: person.name,
          totalAmount: personTotal,
          itemNames: personItems[person.id] ?? [],
        ),
      );
    }

    final summary = SplitSummaryModel(
      subtotal: subtotal,
      taxAmount: taxAmount,
      taxPercentage: state.taxPercentage,
      serviceChargeAmount: serviceChargeAmount,
      includedTaxAmount: includedTaxAmount,
      totalAmount: finalTotal,
      roundingAmount: roundingAmount,
      taxMode: state.taxMode,
      personSummaries: personSummaries,
    );

    emit(
      state.copyWith(splitStatus: SplitStatus.success, summaryModel: summary),
    );
  }

  void _onResetSplitStatusEvent(
    OnResetSplitStatusEvent event,
    Emitter<SplitState> emit,
  ) {
    _logger.debug("OnResetSplitStatusEvent");
    emit(state.copyWith(splitStatus: SplitStatus.initial));
  }
}
