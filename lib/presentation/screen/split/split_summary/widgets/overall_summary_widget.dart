import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/screen/split/split_summary/bloc/split_summary_bloc.dart';

class OverallSummaryWidget extends StatelessWidget {
  const OverallSummaryWidget({super.key});

  Widget _row(String label, double value, {bool isMoney = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            isMoney
                ? "RM ${value.toStringAsFixed(2)}"
                : value.toStringAsFixed(0),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplitSummaryBloc, SplitSummaryState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 16,
            right: 16,
            bottom: 8,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(12),
            ),

            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Overall Summary",
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _row(
                    "Total Person(s)",
                    state.summaryModel?.persons.toDouble() ?? 0,
                    isMoney: false,
                  ),
                  _row(
                    "Total Bill Subtotal",
                    state.summaryModel?.totalSubtotal ?? 0,
                  ),
                  if (state.summaryModel?.isIncludeSst == true)
                    _row("SST", state.summaryModel?.totalSst ?? 0),
                  _row(
                    "Service Charge Input",
                    state.summaryModel?.totalServiceChargeInput ?? 0,
                  ),
                  _row(
                    "Service Charge Calculate",
                    state.summaryModel?.totalServiceChargeCalculate ?? 0,
                  ),
                  _row(
                    "Service Charge Difference",
                    state.summaryModel?.totalServiceChargeDifference ?? 0,
                  ),
                  _row(
                    "Total Bill Input",
                    state.summaryModel?.totalBillInput ?? 0,
                  ),
                  _row(
                    "Total Bill Calculate",
                    state.summaryModel?.totalBillCalculate ?? 0,
                  ),

                  _row(
                    "Total Bill Difference",
                    state.summaryModel?.totalBillDifference ?? 0,
                  ),

                  if (state.summaryModel?.isIncludeSst == true)
                    _row("SST", state.summaryModel?.totalSst ?? 0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
