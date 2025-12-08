import 'package:flutter/material.dart';
import 'package:numeru/extensions/context_extension.dart';

class DeleteFoodDialogWidget extends StatelessWidget {
  const DeleteFoodDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delete?",
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Are you sure want to delete this food?"),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor:
                          context.colorScheme.surfaceContainerHighest,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: context.colorScheme.onSurface),
                    ),
                  ),
                ),
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: context.colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Delete"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
