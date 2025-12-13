import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/data/models/summary_model.dart';

part 'split_summary_event.dart';
part 'split_summary_state.dart';

class SplitSummaryBloc extends Bloc<SplitSummaryEvent, SplitSummaryState> {
  SplitSummaryBloc({required SummaryModel summaryModel})
    : super(SplitSummaryState(summaryModel: summaryModel));
}
