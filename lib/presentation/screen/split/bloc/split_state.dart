part of 'split_bloc.dart';

enum SplitStatus { initial, loading, success, failure }

class SplitState extends Equatable {
  final SplitStatus splitStatus;
  final List<PersonModel> peopleModel;

  const SplitState({
    this.splitStatus = SplitStatus.initial,
    this.peopleModel = const [],
  });

  SplitState copyWith({
    SplitStatus? splitStatus,
    List<PersonModel>? peopleModel,
  }) {
    return SplitState(
      splitStatus: splitStatus ?? this.splitStatus,
      peopleModel: peopleModel ?? this.peopleModel,
    );
  }

  @override
  List<Object?> get props => [splitStatus, peopleModel];
}
