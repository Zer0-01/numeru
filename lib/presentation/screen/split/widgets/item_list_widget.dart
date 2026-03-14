import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/data/models/item_model.dart';
import 'package:numeru/presentation/common_widgets/buttons/app_outlined_button_widget.dart';
import 'package:numeru/presentation/screen/split/bloc/split_bloc.dart';
import 'package:numeru/presentation/screen/split/widgets/item_card_widget.dart';

class ItemListWidget extends StatefulWidget {
  const ItemListWidget({super.key});

  @override
  State<ItemListWidget> createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {
  final GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();
  List<ItemModel> _items = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplitBloc, SplitState>(
      listener: (context, state) {
        final newItems = state.itemsModel;
        if (_items.length < newItems.length) {
          // Item added
          _listKey.currentState?.insertItem(newItems.length - 1);
        } else if (_items.length > newItems.length) {
          // Item removed
          int removedIndex = -1;
          for (int i = 0; i < _items.length; i++) {
            if (!newItems.any((item) => item.id == _items[i].id)) {
              removedIndex = i;
              break;
            }
          }

          if (removedIndex != -1) {
            final removedItem = _items[removedIndex];
            _listKey.currentState?.removeItem(
              removedIndex,
              (context, animation) => ItemCardWidget(
                key: ValueKey(removedItem.id),
                item: removedItem,
                persons: state.peopleModel,
                animation: animation,
              ),
            );
          }
        }
        _items = List.from(newItems);
      },
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsetsGeometry.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          sliver: SliverMainAxisGroup(
            slivers: [
              SliverAnimatedList(
                key: _listKey,
                initialItemCount: _items.length,
                itemBuilder: (context, index, animation) {
                  if (index >= _items.length) return const SizedBox.shrink();
                  final item = _items[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ItemCardWidget(
                      key: ValueKey(item.id),
                      item: item,
                      persons: state.peopleModel,
                      animation: animation,
                    ),
                  );
                },
              ),
              SliverToBoxAdapter(
                child: AppOutlinedButtonWidget(
                  label: "Add Item",
                  onPressed: () {
                    context.read<SplitBloc>().add(const OnAddItemEvent());
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
