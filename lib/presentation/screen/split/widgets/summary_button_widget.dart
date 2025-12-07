import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/data/models/person_model.dart';
import 'package:numeru/presentation/screen/split/bloc/split_bloc.dart';

class SummaryButtonWidget extends StatelessWidget {
  final TextEditingController serviceChargeController;
  final TextEditingController totalBillController;
  final TextEditingController roundingController;

  const SummaryButtonWidget({
    super.key,
    required this.serviceChargeController,
    required this.totalBillController,
    required this.roundingController,
  });

  bool _getIsButtonEnabled(
    List<PersonModel> persons,
    bool isHaveServiceCharge,
    bool isHaveRounding,
  ) {
    // Must have at least 1 person
    if (persons.isEmpty) return false;

    // Must have food for at least 1 person
    final hasFood = persons.any((p) => p.foods.isNotEmpty);
    if (!hasFood) return false;

    // Total bill required
    if (totalBillController.text.trim().isEmpty) return false;

    // If service charge required → must not be empty
    if (isHaveServiceCharge && serviceChargeController.text.trim().isEmpty) {
      return false;
    }

    // If rounding required → must not be empty
    if (isHaveRounding && roundingController.text.trim().isEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplitBloc, SplitState>(
      builder: (context, state) {
        return SliverPadding(
          padding: EdgeInsetsGeometry.all(8),
          sliver: SliverToBoxAdapter(
            child: SafeArea(
              child: FilledButton(
                onPressed:
                    _getIsButtonEnabled(
                          state.persons,
                          state.isHaveServiceCharge,
                          state.isHaveRounding,
                        )
                        ? () {
                          debugPrint("Helo");
                          context.read<SplitBloc>().add(
                            OnPressedSummaryEvent(
                              serviceCharge:
                                  double.tryParse(
                                    serviceChargeController.text,
                                  ) ??
                                  0,
                              totalBill:
                                  double.tryParse(totalBillController.text) ??
                                  0,
                            ),
                          );
                        }
                        : null,
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Summary"),
              ),
            ),
          ),
        );
      },
    );
  }
}
