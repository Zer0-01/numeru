import 'package:flutter/material.dart';
import 'package:numeru/constant/padding_constant.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/common_widgets/app_dialog_widget.dart';

class WhoIsPayingWidget extends StatelessWidget {
  const WhoIsPayingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: PaddingConstant.bottom(bottom: 8, others: 16),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Who is paying?",
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AppDialogWidget(
                              title: "Test",
                              topButtonLabel: "Add",
                              onPressedTopButton: () {
                                Navigator.pop(context);
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.colorScheme.surfaceContainer,
                          ),
                        ),
                        child: const Text("+"),
                      ),
                    ),
                    Text(
                      "Add",
                      style: context.textTheme.labelMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
