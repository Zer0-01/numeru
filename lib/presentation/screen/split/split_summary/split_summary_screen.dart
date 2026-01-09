import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:numeru/data/models/summary_model.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/screen/split/split_summary/widgets/overall_summary_widget.dart';
import 'package:numeru/presentation/screen/split/split_summary/widgets/person_summary_widget.dart';

class SplitSummaryScreen extends StatelessWidget {
  final SummaryModel summaryModel;

  const SplitSummaryScreen({super.key, required this.summaryModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Summary"),
        backgroundColor: context.colorScheme.surface,
        foregroundColor: context.colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.router.maybePop(),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [OverallSummaryWidget(), PersonSummaryWidget()],
        ),
      ),
    );
  }
}
