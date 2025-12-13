import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/data/models/summary_model.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/screen/split/split_summary/bloc/split_summary_bloc.dart';

class PersonSummaryWidget extends StatelessWidget {
  const PersonSummaryWidget({super.key});

  Widget _buildFoodItem(SummaryFood food) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text("${food.name} x${food.quantity}")),
          Text("RM ${food.priceWithSst.toStringAsFixed(2)}"),
        ],
      ),
    );
  }

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
            top: 8,
            right: 16,
            bottom: 16,
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: state.summaryModel?.summaryPerson.length ?? 0,
            itemBuilder:
                (context, index) => Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: context.colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.summaryModel?.summaryPerson[index].name ?? "",
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Foods:", style: context.textTheme.bodyLarge),
                      ...?state.summaryModel?.summaryPerson[index].foods.map(
                        (food) => _buildFoodItem(food),
                      ),

                      _row(
                        "Subtotal",
                        state.summaryModel?.summaryPerson[index].subtotal ?? 0,
                      ),
                      _row(
                        "Service Charge",
                        state
                                .summaryModel
                                ?.summaryPerson[index]
                                .serviceCharge ??
                            0,
                      ),
                      _row(
                        "SST",
                        state.summaryModel?.summaryPerson[index].sst ?? 0,
                      ),
                      _row(
                        "Need To Pay",
                        state.summaryModel?.summaryPerson[index].needToPay ?? 0,
                      ),
                    ],
                  ),
                ),
          ),
        );
      },
    );
  }
}
