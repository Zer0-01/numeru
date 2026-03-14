import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/data/models/item_model.dart';
import 'package:numeru/data/models/person_model.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/common_widgets/app_chip_widget.dart';
import 'package:numeru/presentation/common_widgets/app_dialog_widget.dart';
import 'package:numeru/presentation/common_widgets/app_switch_widget.dart';
import 'package:numeru/presentation/common_widgets/app_text_field_widget.dart';
import 'package:numeru/presentation/common_widgets/buttons/app_filled_button_widget.dart';
import 'package:numeru/presentation/common_widgets/buttons/app_outlined_button_widget.dart';
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
                child: AppTextFieldWidget(
                  hint: "Item Name",
                  initialValue: item.name,
                  onChanged: (val) {
                    context.read<SplitBloc>().add(
                      OnUpdateItemEvent(id: item.id, name: val),
                    );
                  },
                ),
              ),
              Expanded(
                child: AppTextFieldWidget(
                  hint: "Price",
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  initialValue: item.price > 0 ? item.price.toString() : "",
                  prefixIcon: const Icon(Icons.attach_money_rounded, size: 18),
                  onChanged: (val) {
                    final price = double.tryParse(val) ?? 0.0;
                    context.read<SplitBloc>().add(
                      OnUpdateItemEvent(id: item.id, price: price),
                    );
                  },
                ),
              ),
              IconButton.filledTonal(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (dialogContext) => AppDialogWidget.alert(
                          title: "Remove Item",
                          subtitle: "Are you sure you want to remove this item?",
                          secondaryButton: AppOutlinedButtonWidget(
                            label: "Cancel",
                            onPressed: () => Navigator.pop(dialogContext),
                          ),
                          primaryButton: AppFilledButtonWidget(
                            label: "Remove",
                            onPressed: () {
                              context.read<SplitBloc>().add(
                                OnRemoveItemEvent(item.id),
                              );
                              Navigator.pop(dialogContext);
                            },
                          ),
                        ),
                  );
                },
                iconSize: 20,
                icon: const Icon(Icons.delete_outline_rounded),
                style: IconButton.styleFrom(
                  foregroundColor: context.colorScheme.error,
                  backgroundColor: context.colorScheme.errorContainer.withValues(
                    alpha: 0.5,
                  ),
                ),
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
                        return AppChipWidget(
                          label: person.name,
                          selected: isSelected,
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
              AppSwitchWidget(
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
