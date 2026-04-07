import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/presentation/screen/split/bloc/split_bloc.dart';
import 'package:numeru/presentation/screen/split/widgets/item_card_widget.dart';

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplitBloc, SplitState>(
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 16),
              ...state.itemsModel.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ItemCardWidget(item: item, persons: state.peopleModel),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
