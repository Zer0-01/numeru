import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          context.router.push(SplitSummaryRoute(summary: state.summaryModel!));
          context.read<EqualSplitBloc>().add(const OnResetSplitStatusEvent());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Equal Split"),
        ),
        body: BlocBuilder<EqualSplitBloc, EqualSplitState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.itemsModel.length,
                    itemBuilder: (context, index) {
                      final item = state.itemsModel[index];
                      return Card(
                        child: ListTile(
                          title: TextFormField(
                            initialValue: item.name,
                            decoration: const InputDecoration(hintText: "Item Name"),
                            onChanged: (val) => context.read<EqualSplitBloc>().add(
                                  OnUpdateItemEvent(id: item.id, name: val),
                                ),
                          ),
                          subtitle: TextFormField(
                            initialValue: item.price > 0 ? item.price.toString() : "",
                            decoration: const InputDecoration(hintText: "Price"),
                            keyboardType: TextInputType.number,
                            onChanged: (val) => context.read<EqualSplitBloc>().add(
                                  OnUpdateItemEvent(
                                      id: item.id, price: double.tryParse(val) ?? 0),
                                ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => context.read<EqualSplitBloc>().add(
                                  OnRemoveItemEvent(item.id),
                                ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text("Total People: ${state.peopleModel.length}"),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.person_add),
                        onPressed: () =>
                            context.read<EqualSplitBloc>().add(const OnAddPeopleEvent()),
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: state.itemsModel.isEmpty || state.peopleModel.isEmpty
                            ? null
                            : () => context
                                .read<EqualSplitBloc>()
                                .add(const OnCalculateSplitEvent()),
                        child: const Text("Calculate Equal Split"),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<EqualSplitBloc>().add(const OnAddItemEvent()),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
