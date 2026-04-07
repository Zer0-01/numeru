import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:numeru/config/app_logger.dart';
import 'package:numeru/data/models/item_model.dart';
import 'package:numeru/data/models/person_model.dart';
import 'package:numeru/data/models/split_summary_model.dart';
import 'package:numeru/logic/split_bill/split_bill_calculator.dart';

part 'equal_split_event.dart';
part 'equal_split_state.dart';

class EqualSplitBloc extends Bloc<EqualSplitEvent, EqualSplitState> {
  final AppLogger _logger = AppLogger.getLogger('EqualSplitBloc');

  EqualSplitBloc() : super(const EqualSplitState()) {
    on<OnAddPeopleEvent>(_onAddPeopleEvent);
    on<OnRemovePeopleEvent>(_onRemovePeopleEvent);
    on<OnAddItemEvent>(_onAddItemEvent);
    on<OnRemoveItemEvent>(_onRemoveItemEvent);
    on<OnUpdateItemEvent>(_onUpdateItemEvent);
    on<OnToggleItemTaxableEvent>(_onToggleItemTaxableEvent);
    on<OnUpdateTaxValueEvent>(_onUpdateTaxValueEvent);
    on<OnUpdateServiceChargeRateEvent>(_onUpdateServiceChargeRateEvent);
    on<OnCalculateSplitEvent>(_onCalculateSplitEvent);
    on<OnResetSplitStatusEvent>(_onResetSplitStatusEvent);
  }

  void _onAddPeopleEvent(OnAddPeopleEvent event, Emitter<EqualSplitState> emit) {
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

  void _onAddItemEvent(OnAddItemEvent event, Emitter<EqualSplitState> emit) {
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

  void _onRemoveItemEvent(OnRemoveItemEvent event, Emitter<EqualSplitState> emit) {
    _logger.debug("OnRemoveItemEvent: ${event.itemId}");
    final updatedItems =
        state.itemsModel.where((item) => item.id != event.itemId).toList();

    emit(state.copyWith(itemsModel: updatedItems));
  }

  void _onUpdateItemEvent(OnUpdateItemEvent event, Emitter<EqualSplitState> emit) {
    _logger.debug("OnUpdateItemEvent: ${event.id}");
    final updatedItems =
        state.itemsModel.map((item) {
          if (item.id == event.id) {
            return item.copyWith(
              name: event.name,
              price: event.price,
              isTaxable: event.isTaxable,
            );
          }
          return item;
        }).toList();

    emit(state.copyWith(itemsModel: updatedItems));
  }

  void _onToggleItemTaxableEvent(
    OnToggleItemTaxableEvent event,
    Emitter<EqualSplitState> emit,
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

  void _onRemovePeopleEvent(
    OnRemovePeopleEvent event,
    Emitter<EqualSplitState> emit,
  ) {
    _logger.debug("OnRemovePeopleEvent: ${event.id}");
    final updatedPeople =
        state.peopleModel.where((p) => p.id != event.id).toList();
    emit(state.copyWith(peopleModel: updatedPeople));
  }

  void _onUpdateTaxValueEvent(
    OnUpdateTaxValueEvent event,
    Emitter<EqualSplitState> emit,
  ) {
    _logger.debug("OnUpdateTaxValueEvent: ${event.taxPercentage}");
    emit(state.copyWith(taxPercentage: event.taxPercentage));
  }

  void _onUpdateServiceChargeRateEvent(
    OnUpdateServiceChargeRateEvent event,
    Emitter<EqualSplitState> emit,
  ) {
    _logger.debug("OnUpdateServiceChargeRateEvent: ${event.serviceChargeRate}");
    emit(state.copyWith(serviceChargeRate: event.serviceChargeRate));
  }

  void _onCalculateSplitEvent(
    OnCalculateSplitEvent event,
    Emitter<EqualSplitState> emit,
  ) {
    _logger.debug("OnCalculateSplitEvent");
    emit(state.copyWith(splitStatus: SplitStatus.loading));

    final summary = SplitBillCalculator.calculateSituation1(
      items: state.itemsModel,
      people: state.peopleModel,
      taxRatePercentage: state.taxPercentage,
      serviceChargeRatePercentage: state.serviceChargeRate,
    );

    emit(
      state.copyWith(splitStatus: SplitStatus.success, summaryModel: summary),
    );
  }

  void _onResetSplitStatusEvent(
    OnResetSplitStatusEvent event,
    Emitter<EqualSplitState> emit,
  ) {
    _logger.debug("OnResetSplitStatusEvent");
    emit(state.copyWith(splitStatus: SplitStatus.initial));
  }
}
