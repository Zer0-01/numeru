import 'package:flutter/material.dart';

class AppDialogWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget? secondaryButton;
  final Widget? primaryButton;

  const AppDialogWidget({
    super.key,
    this.title,
    this.subtitle,
    this.secondaryButton,
    this.primaryButton,
  });

  const AppDialogWidget.alert({
    super.key,
    required this.title,
    required this.subtitle,
    required this.secondaryButton,
    required this.primaryButton,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Text(
                title!,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            const SizedBox(height: 24),
            if (secondaryButton != null || primaryButton != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 8,
                children: [
                  if (secondaryButton != null)
                    Expanded(child: secondaryButton!),
                  if (primaryButton != null) Expanded(child: primaryButton!),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
