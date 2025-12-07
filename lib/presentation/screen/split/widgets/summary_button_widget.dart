import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/presentation/screen/split/bloc/split_bloc.dart';

class SummaryButtonWidget extends StatelessWidget {
  final TextEditingController serviceChargeController;
  final TextEditingController totalBillController;

  const SummaryButtonWidget({
    super.key,
    required this.serviceChargeController,
    required this.totalBillController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplitBloc, SplitState>(
      builder: (context, state) {
        return SliverPadding(
          padding: EdgeInsetsGeometry.all(8),
          sliver: SliverToBoxAdapter(
            child: SafeArea(
              child: FilledButton(
                onPressed: () {
                  debugPrint("Helo");
                  context.read<SplitBloc>().add(
                    OnPressedSummaryEvent(
                      serviceCharge:
                          double.tryParse(serviceChargeController.text) ?? 0,
                      totalBill: double.tryParse(totalBillController.text) ?? 0,
                    ),
                  );
                },
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
