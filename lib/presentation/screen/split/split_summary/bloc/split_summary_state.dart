part of 'split_summary_bloc.dart';

class SplitSummaryState extends Equatable {
  final SummaryModel? summaryModel;

  const SplitSummaryState({this.summaryModel});

  SplitSummaryState copyWith({SummaryModel? summaryModel}) {
    return SplitSummaryState(summaryModel: summaryModel ?? this.summaryModel);
  }

  @override
  List<Object> get props => [];
}
