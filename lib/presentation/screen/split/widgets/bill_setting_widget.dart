import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/extensions/context_extension.dart';
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
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
          sliver: SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
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
                        activeTrackColor: context.colorScheme.primary,
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
                        activeTrackColor: context.colorScheme.primary,
                      ),
                    ],
                  ),
                  if (state.isHaveServiceCharge)
                    TextFormField(
                      controller: serviceChargeController,
                      decoration: InputDecoration(
                        filled: true,
                        isDense: true,
                        fillColor: context.colorScheme.primaryContainer,
                        hintText: "Service Charge",
                        hintStyle: TextStyle(
                          color: context.colorScheme.onPrimaryContainer,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: context.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),

                  Row(
                    spacing: 4,
                    children: [
                      Expanded(child: Text("Total Bill")),
                      Expanded(
                        child: TextFormField(
                          controller: totalBillController,
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            fillColor: context.colorScheme.primaryContainer,

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: context.colorScheme.primary,
                              ),
                            ),
                          ),
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
