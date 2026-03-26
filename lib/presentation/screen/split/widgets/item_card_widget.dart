import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/data/models/item_model.dart';
import 'package:numeru/data/models/person_model.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/screen/split/bloc/split_bloc.dart';

class ItemCardWidget extends StatelessWidget {
  final ItemModel item;
  final List<PersonModel> persons;
  final Animation<double>? animation;

  const ItemCardWidget({
    super.key,
    required this.item,
    required this.persons,
    this.animation,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSharedToAll =
        item.personIds.length == persons.length && persons.isNotEmpty;

    Widget content = Container(
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
          Row(
            spacing: 12,
            children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  decoration: const InputDecoration(hintText: "Item Name"),
                  initialValue: item.name,
                  onChanged: (val) {
                    context.read<SplitBloc>().add(
                      OnUpdateItemEvent(id: item.id, name: val),
                    );
                  },
                ),
              ),

              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (dialogContext) => AlertDialog(
                          title: const Text("Remove Item"),
                          content: const Text(
                            "Are you sure you want to remove this item?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(dialogContext),
                              child: const Text("Cancel"),
                            ),
                            FilledButton(
                              onPressed: () {
                                context.read<SplitBloc>().add(
                                  OnRemoveItemEvent(item.id),
                                );
                                Navigator.pop(dialogContext);
                              },
                              child: const Text("Remove"),
                            ),
                          ],
                        ),
                  );
                },

                icon: const Icon(Icons.delete_outline_rounded),
                style: IconButton.styleFrom(
                  foregroundColor: context.colorScheme.error,
                ),
                // style: IconButton.styleFrom(
                //   foregroundColor: context.colorScheme.error,
                //   backgroundColor: context.colorScheme.errorContainer
                //       .withValues(alpha: 0.5),
                // ),
              ),
            ],
          ),
          BlocBuilder<SplitBloc, SplitState>(
            buildWhen:
                (previous, current) => previous.taxMode != current.taxMode,
            builder: (context, state) {
              return TextFormField(
                decoration: InputDecoration(
                  hintText: "Price",
                  prefixIcon: const Icon(Icons.attach_money_rounded, size: 18),
                  suffixText: state.taxMode == "INCLUSIVE" ? "incl." : "excl.",
                  suffixStyle: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    fontSize: 10,
                  ),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                initialValue: item.price > 0 ? item.price.toString() : "",
                onChanged: (val) {
                  final price = double.tryParse(val) ?? 0.0;
                  context.read<SplitBloc>().add(
                    OnUpdateItemEvent(id: item.id, price: price),
                  );
                },
              );
            },
          ),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      "Qty:",
                      style: context.textTheme.labelMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 50,
                      child: TextFormField(
                        decoration: const InputDecoration(hintText: "1"),
                        initialValue: item.quantity.toString(),
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          final qty = int.tryParse(val) ?? 1;
                          context.read<SplitBloc>().add(
                            OnUpdateItemEvent(id: item.id, quantity: qty),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "Taxable",
                    style: context.textTheme.labelMedium?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Checkbox(
                    value: item.isTaxable,
                    onChanged: (val) {
                      context.read<SplitBloc>().add(
                        OnUpdateItemEvent(id: item.id, isTaxable: val ?? true),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                "For whom?",
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8,
                  children:
                      persons.map((person) {
                        final bool isSelected = item.personIds.contains(
                          person.id,
                        );
                        return FilterChip(
                          label: Text(person.name),
                          selected: isSelected,
                          showCheckmark: false,
                          onSelected: (_) {
                            context.read<SplitBloc>().add(
                              OnToggleItemPersonEvent(
                                itemId: item.id,
                                personId: person.id,
                              ),
                            );
                          },
                        );
                      }).toList(),
                ),
              ),
            ],
          ),
          const Divider(height: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shared to all",
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              Switch(
                value: isSharedToAll,
                onChanged: (val) {
                  context.read<SplitBloc>().add(
                    OnToggleAllItemPersonsEvent(itemId: item.id, isShared: val),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );

    if (animation != null) {
      return SizeTransition(
        sizeFactor: animation!,
        child: FadeTransition(opacity: animation!, child: content),
      );
    }

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
      tween: Tween<double>(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, -20 * (1 - value)),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: content,
    );
  }
}
