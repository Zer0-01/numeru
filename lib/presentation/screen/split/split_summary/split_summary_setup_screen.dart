import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:numeru/data/models/summary_model.dart';
import 'package:numeru/presentation/screen/split/split_summary/split_summary_screen.dart';

@RoutePage()
class SplitSummarySetupScreen extends StatelessWidget {
  final SummaryModel summaryModel;

  const SplitSummarySetupScreen({super.key, required this.summaryModel});

  @override
  Widget build(BuildContext context) {
    return SplitSummaryScreen(summaryModel: summaryModel);
  }
}
