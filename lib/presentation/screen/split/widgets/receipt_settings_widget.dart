import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/screen/split/bloc/split_bloc.dart';

class ReceiptSettingsWidget extends StatelessWidget {
  const ReceiptSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplitBloc, SplitState>(
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          sliver: SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  Text(
                    "Receipt Settings",
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bill Situation",
                        style: context.textTheme.labelMedium?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      DropdownButton<SituationType>(
                        value: state.situationType,
                        underline: const SizedBox(),
                        items: const [
                          DropdownMenuItem(
                            value: SituationType.standardCafe,
                            child: Text("Standard Café (++)"),
                          ),
                        ],
                        onChanged: (val) {
                          if (val != null) {
                            context.read<SplitBloc>().add(
                              OnUpdateSituationTypeEvent(val),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  Text(
                    "Service (10%) + SST (6%) applied to total",
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.primary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const Divider(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tax Value (%)",
                        style: context.textTheme.labelMedium?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        child: TextFormField(
                          decoration: const InputDecoration(hintText: "0"),
                          initialValue: state.taxPercentage.toString(),
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onChanged: (val) {
                            final tax = double.tryParse(val) ?? 0.0;
                            context.read<SplitBloc>().add(
                              OnUpdateTaxValueEvent(tax),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Service Charge (%)",
                        style: context.textTheme.labelMedium?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        child: TextFormField(
                          decoration: const InputDecoration(hintText: "10"),
                          initialValue: state.serviceChargeRate.toString(),
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onChanged: (val) {
                            final sc = double.tryParse(val) ?? 0.0;
                            context.read<SplitBloc>().add(
                              OnUpdateServiceChargeRateEvent(sc),
                            );
                          },
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
