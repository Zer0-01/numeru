import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:numeru/config/app_logger.dart';
import 'package:numeru/data/models/item_model.dart';
import 'package:numeru/data/models/person_model.dart';

part 'split_event.dart';
part 'split_state.dart';

class SplitBloc extends Bloc<SplitEvent, SplitState> {
  final AppLogger _logger = AppLogger.getLogger('SplitBloc');

  SplitBloc() : super(const SplitState()) {
    on<OnAddPeopleEvent>(_onAddPeopleEvent);
    on<OnRemovePeopleEvent>(_onRemovePeopleEvent);
    on<OnAddItemEvent>(_onAddItemEvent);
    on<OnUpdateItemEvent>(_onUpdateItemEvent);
    on<OnToggleItemPersonEvent>(_onToggleItemPersonEvent);
    on<OnToggleAllItemPersonsEvent>(_onToggleAllItemPersonsEvent);
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
}
