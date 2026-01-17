import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/presentation/common_widgets/buttons/app_outlined_button_widget.dart';
import 'package:numeru/presentation/screen/split/bloc/split_bloc.dart';
import 'package:numeru/presentation/screen/split/widgets/item_card_widget.dart';

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplitBloc, SplitState>(
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsetsGeometry.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          sliver: SliverList.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: state.itemsModel.length + 1,
            itemBuilder: (context, index) {
              if (index == state.itemsModel.length) {
                return AppOutlinedButtonWidget(
                  label: "Add Item",
                  onPressed: () {
                    context.read<SplitBloc>().add(const OnAddItemEvent());
                  },
                );
              }

              return ItemCardWidget(persons: state.peopleModel);
            },
          ),
        );
      },
    );
  }
}
