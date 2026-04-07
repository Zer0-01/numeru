import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/screen/split/widgets/item_list_widget.dart';
import 'package:numeru/presentation/screen/split/widgets/receipt_settings_widget.dart';
import 'package:numeru/presentation/screen/split/widgets/who_is_paying_widget.dart';
import 'package:numeru/router/app_router.gr.dart';
import 'package:numeru/presentation/screen/split/bloc/split_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplitScreen extends StatelessWidget {
  const SplitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplitBloc, SplitState>(
      listenWhen:
          (previous, current) =>
              previous.splitStatus != SplitStatus.success &&
              current.splitStatus == SplitStatus.success,
      listener: (context, state) {
        if (state.summaryModel != null) {
          context.router.push(SplitSummaryRoute(summary: state.summaryModel!));
          context.read<SplitBloc>().add(const OnResetSplitStatusEvent());
        }
      },
      child: BlocBuilder<SplitBloc, SplitState>(
        builder: (context, state) {
          final bool hasNoItem = state.itemsModel.isEmpty;
          final bool hasNoPerson = state.peopleModel.isEmpty;
          final bool hasItemWithNoName = state.itemsModel.any(
            (item) => item.name.trim().isEmpty,
          );
          final bool hasItemWithNoPrice = state.itemsModel.any(
            (item) => item.price <= 0,
          );
          final bool hasItemWithNoPerson = state.itemsModel.any(
            (item) => item.personIds.isEmpty,
          );
          final bool hasNoTaxValueWhenTaxModeIsExclusive =
              state.taxMode == "EXCLUSIVE" && state.taxPercentage <= 0;

          final bool isDisabled =
              hasNoItem ||
              hasNoPerson ||
              hasItemWithNoName ||
              hasItemWithNoPrice ||
              hasItemWithNoPerson ||
              hasNoTaxValueWhenTaxModeIsExclusive;

          return Scaffold(
            appBar: AppBar(
              // leading: IconButton(
              //   onPressed: () => context.router.maybePop(),
              //   icon: const Icon(Icons.chevron_left),
              // ),
              title: const Text("Split"),
            ),
            body: const CustomScrollView(
              slivers: [
                WhoIsPayingWidget(),
                ItemListWidget(),
                ReceiptSettingsWidget(),
                SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.read<SplitBloc>().add(const OnAddItemEvent());
              },
              tooltip: 'Add Item',
              child: const Icon(Icons.add),
            ),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Split between"),
                        Text(
                          "${state.peopleModel.length} People",
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: FilledButton(
                      onPressed:
                          isDisabled
                              ? null
                              : () {
                                context.read<SplitBloc>().add(
                                  const OnCalculateSplitEvent(),
                                );
                              },
                      child: const Text("Split"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
