import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:numeru/config/app_logger.dart';
import 'package:numeru/data/models/person_model.dart';

part 'split_event.dart';
part 'split_state.dart';

class SplitBloc extends Bloc<SplitEvent, SplitState> {
  final AppLogger _logger = AppLogger.getLogger('SplitBloc');

  SplitBloc() : super(const SplitState()) {
    on<OnAddPeopleEvent>(_onAddPeopleEvent);
  }

  void _onAddPeopleEvent(OnAddPeopleEvent event, Emitter<SplitState> emit) {
    _logger.debug("OnAddPeopleEvent");
    final PersonModel person = PersonModel(
      id: state.peopleModel.length + 1,
      name: "Person ${state.peopleModel.length + 1}",
    );

    emit(state.copyWith(peopleModel: [...state.peopleModel, person]));
  }
}
