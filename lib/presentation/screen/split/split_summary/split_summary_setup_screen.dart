import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/data/models/summary_model.dart';
import 'package:numeru/presentation/screen/split/split_summary/bloc/split_summary_bloc.dart';
import 'package:numeru/presentation/screen/split/split_summary/split_summary_screen.dart';

@RoutePage()
class SplitSummarySetupScreen extends StatelessWidget {
  final SummaryModel summaryModel;

  const SplitSummarySetupScreen({super.key, required this.summaryModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplitSummaryBloc(summaryModel: summaryModel),
      child: SplitSummaryScreen(summaryModel: summaryModel),
    );
  }
}
