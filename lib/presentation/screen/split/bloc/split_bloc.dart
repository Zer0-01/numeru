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
    on<OnAddItemEvent>(_onAddItemEvent);
  }

  void _onAddPeopleEvent(OnAddPeopleEvent event, Emitter<SplitState> emit) {
    _logger.debug("OnAddPeopleEvent");
    final PersonModel person = PersonModel(
      id: state.peopleModel.length + 1,
      name: "Person ${state.peopleModel.length + 1}",
    );

    emit(state.copyWith(peopleModel: [...state.peopleModel, person]));
  }

  void _onAddItemEvent(OnAddItemEvent event, Emitter<SplitState> emit) {
    _logger.debug("OnAddItemEvent");
    final ItemModel item = ItemModel(
      id: state.itemsModel.length + 1,
      name: "Item ${state.itemsModel.length + 1}",
      price: 0,
      personIds: [],
    );

    emit(state.copyWith(itemsModel: [...state.itemsModel, item]));
  }
}
