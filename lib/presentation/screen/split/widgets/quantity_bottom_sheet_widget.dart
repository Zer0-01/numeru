import 'package:flutter/material.dart';
import 'package:numeru/extensions/context_extension.dart';

class QuantityBottomSheetWidget extends StatelessWidget {
  final int selectedQuantity;

  const QuantityBottomSheetWidget({
    super.key,
    required this.selectedQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Select Quantity",
          style: context.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              final qty = index + 1;
              return ListTile(
                title: Text(qty.toString()),
                trailing:
                    selectedQuantity == qty
                        ? Icon(
                          Icons.check_rounded,
                          color: context.colorScheme.primary,
                        )
                        : null,
                onTap: () {
                  Navigator.pop(context, qty);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
