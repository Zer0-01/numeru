import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/data/models/split_summary_model.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/screen/split/equal_split/bloc/equal_split_bloc.dart';
import 'package:numeru/router/app_router.gr.dart';

@RoutePage()
class EqualSplitScreen extends StatelessWidget {
  const EqualSplitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EqualSplitBloc, EqualSplitState>(
      listenWhen:
          (previous, current) =>
              previous.splitStatus != SplitStatus.success &&
              current.splitStatus == SplitStatus.success,
      listener: (context, state) {
        if (state.summaryModel != null) {
          // Map EqualSplitSummaryModel back to common SplitSummaryModel for navigation
          final commonSummary = SplitSummaryModel(
            subtotal: state.summaryModel!.subtotal,
            taxAmount: state.summaryModel!.taxAmount,
            taxPercentage: state.summaryModel!.taxPercentage,
            serviceChargeAmount: state.summaryModel!.serviceChargeAmount,
            totalAmount: state.summaryModel!.totalAmount,
            roundingAmount: state.summaryModel!.roundingAmount,
            personSummaries: List.generate(
              state.summaryModel!.numberOfPeople,
              (index) => PersonSummaryModel(
                id: index + 1,
                name: "Person ${index + 1}",
                totalAmount: state.summaryModel!.amountPerPerson,
                itemNames:
                    state.itemsModel
                        .map((e) => e.name.isEmpty ? "Unnamed Item" : e.name)
                        .toList(),
              ),
            ),
          );

          context.router.push(SplitSummaryRoute(summary: commonSummary));
          context.read<EqualSplitBloc>().add(const OnResetSplitStatusEvent());
        }
      },
      child: BlocBuilder<EqualSplitBloc, EqualSplitState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: _buildBottomAppBar(context, state),
            appBar: AppBar(
              title: const Text("Equal Split"),
              leading: IconButton(
                onPressed: () => context.router.maybePop(),
                icon: const Icon(Icons.chevron_left),
              ),
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: _buildTotalPeople(context, state),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverList.builder(
                    itemCount: state.itemsModel.length,
                    itemBuilder: (context, index) {
                      final item = state.itemsModel[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: context.colorScheme.surfaceContainerLowest,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                spacing: 4,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    initialValue: item.name,
                                    decoration: const InputDecoration(
                                      hintText: "Item Name",
                                    ),
                                    style: context.textTheme.titleMedium,
                                    onChanged:
                                        (val) =>
                                            context.read<EqualSplitBloc>().add(
                                              OnUpdateItemEvent(
                                                id: item.id,
                                                name: val,
                                              ),
                                            ),
                                  ),
                                  TextFormField(
                                    initialValue:
                                        item.price > 0
                                            ? item.price.toString()
                                            : "",
                                    decoration: const InputDecoration(
                                      hintText: "Price (RM)",
                                    ),
                                    style: context.textTheme.bodyMedium
                                        ?.copyWith(
                                          color:
                                              context
                                                  .colorScheme
                                                  .onSurfaceVariant,
                                        ),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                          decimal: true,
                                        ),
                                    onChanged:
                                        (val) =>
                                            context.read<EqualSplitBloc>().add(
                                              OnUpdateItemEvent(
                                                id: item.id,
                                                price:
                                                    double.tryParse(val) ?? 0,
                                              ),
                                            ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed:
                                  () => context.read<EqualSplitBloc>().add(
                                    OnRemoveItemEvent(item.id),
                                  ),
                              style: IconButton.styleFrom(
                                foregroundColor: context.colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed:
                  () => context.read<EqualSplitBloc>().add(
                    const OnAddItemEvent(),
                  ),
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomAppBar(BuildContext context, EqualSplitState state) {
    return BottomAppBar(
      child: Row(
        children: [
          Expanded(
            child: FilledButton(
              onPressed:
                  state.itemsModel.isEmpty || state.numberOfPeople <= 0
                      ? null
                      : () => context.read<EqualSplitBloc>().add(
                        const OnCalculateSplitEvent(),
                      ),
              child: const Text("Calculate Equal Split"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalPeople(BuildContext context, EqualSplitState state) {
    return Card(
      child: ListTile(
        onTap: () => _showPeoplePicker(context, state),
        leading: CircleAvatar(
          backgroundColor: context.colorScheme.primaryContainer,
          child: Icon(
            Icons.people_alt_rounded,
            color: context.colorScheme.primary,
          ),
        ),
        title: Text(
          "Total People",
          style: context.textTheme.labelLarge?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        subtitle: Text(
          "${state.numberOfPeople} People",
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.edit_rounded, size: 20),
      ),
    );
  }

  void _showPeoplePicker(BuildContext context, EqualSplitState state) async {
    final quantity = await showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      builder: (bottomSheetContext) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Number of People",
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    final quantity = index + 1;
                    final isSelected = state.numberOfPeople == quantity;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        label: Text("$quantity"),
                        selected: isSelected,
                        onSelected: (selected) {
                          if (selected) {
                            Navigator.pop(bottomSheetContext, quantity);
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );

    if (!context.mounted) return;
    if (quantity != null) {
      context.read<EqualSplitBloc>().add(OnUpdatePeopleQuantityEvent(quantity));
    }
  }
}
