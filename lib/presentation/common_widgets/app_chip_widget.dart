import 'package:flutter/material.dart';
import 'package:numeru/extensions/context_extension.dart';

class AppChipWidget extends StatelessWidget {
  final String label;
  final void Function(bool)? onSelected;
  final bool? showCheckmark;
  final bool selected;

  const AppChipWidget({
    super.key,
    required this.label,
    required this.onSelected,
    this.showCheckmark,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      labelStyle: context.textTheme.labelSmall?.copyWith(
        color:
            selected
                ? context.colorScheme.onPrimary
                : context.colorScheme.onSurfaceVariant,
      ),
      onSelected: onSelected,
      showCheckmark: showCheckmark ?? false,

      selected: selected,
      selectedColor:
          selected
              ? context.colorScheme.primary
              : context.colorScheme.surfaceContainerLow,
      side: const BorderSide(color: Colors.transparent),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    );
  }
}
