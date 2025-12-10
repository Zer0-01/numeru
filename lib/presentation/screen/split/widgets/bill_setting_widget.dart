import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/common_widgets/app_text_field_widget.dart';
import 'package:numeru/presentation/screen/split/bloc/split_bloc.dart';

class BillSettingWidget extends StatelessWidget {
  final TextEditingController serviceChargeController;
  final TextEditingController totalBillController;
  final TextEditingController roundingController;
  const BillSettingWidget({
    super.key,
    required this.serviceChargeController,
    required this.totalBillController,
    required this.roundingController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplitBloc, SplitState>(
      builder: (context, state) {
        return SliverPadding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 8, vertical: 4),
          sliver: SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                spacing: 8,
                children: [
                  Row(
                    spacing: 4,
                    children: [
                      Expanded(child: Text("Include SST 6%")),
                      Switch.adaptive(
                        value: state.isIncludeSst,
                        onChanged: (_) {
                          context.read<SplitBloc>().add(
                            OnChangedIncludeSstEvent(),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      Expanded(child: Text("Include Service Charge")),
                      Switch.adaptive(
                        value: state.isHaveServiceCharge,
                        onChanged: (_) {
                          context.read<SplitBloc>().add(
                            OnChangedHaveServiceChargeEvent(),
                          );
                        },
                      ),
                    ],
                  ),
                  if (state.isHaveServiceCharge)
                    AppTextFieldWidget(
                      controller: serviceChargeController,
                      label: "Service Charge",
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),

                  Row(
                    spacing: 4,
                    children: [
                      Expanded(child: Text("Total Bill")),
                      Expanded(
                        child: AppTextFieldWidget(
                          controller: totalBillController,
                        ),
                      ),
                    ],
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
