import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/data/models/person_model.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/common_widgets/app_text_field_widget.dart';
import 'package:numeru/presentation/screen/split/bloc/split_bloc.dart';

class PersonListWidget extends StatelessWidget {
  final Map<int, TextEditingController> foodControllers;
  final Map<int, TextEditingController> quantityControllers;
  final Map<int, TextEditingController> priceControllers;
  const PersonListWidget({
    super.key,
    required this.foodControllers,
    required this.quantityControllers,
    required this.priceControllers,
  });

  TextEditingController _getController(
    Map<int, TextEditingController> controllers,
    int key,
  ) {
    if (controllers.containsKey(key)) {
      return controllers[key]!;
    }
    return TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplitBloc, SplitState>(
      builder: (context, state) {
        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          sliver: SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.persons.length,
                itemBuilder: (context, index) {
                  final PersonModel person = state.persons[index];
                  final foodController = _getController(
                    foodControllers,
                    person.id,
                  );
                  final quantityController = _getController(
                    quantityControllers,
                    person.id,
                  );
                  final priceController = _getController(
                    priceControllers,
                    person.id,
                  );

                  return Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              state.persons[index].name,
                              style: context.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 4,
                        children: [
                          Expanded(
                            flex: 2,
                            child: AppTextFieldWidget(
                              controller: foodController,
                              label: "Food Name",
                            ),
                          ),
                          Expanded(
                            child: AppTextFieldWidget(
                              controller: quantityController,
                              label: "Qty",
                            ),
                          ),
                          Expanded(
                            child: AppTextFieldWidget(
                              controller: priceController,
                              label: "Cost",
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FilledButton(
                          onPressed: () {
                            context.read<SplitBloc>().add(
                              OnAddFoodEvent(
                                personId: state.persons[index].id,
                                name: foodController.text,
                                cost:
                                    double.tryParse(priceController.text) ?? 0,
                                quantity:
                                    int.tryParse(quantityController.text) ?? 0,
                              ),
                            );
                          },
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text("Add Food"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: context.colorScheme.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Expanded(child: Text(person.foods[index].name)),
                                Expanded(
                                  child: Text(
                                    person.foods[index].quantity.toString(),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "RM ${person.foods[index].price.toStringAsFixed(2)}",
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder:
                              (context, index) =>
                                  Divider(color: context.colorScheme.outline),
                          itemCount: person.foods.length,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder:
                    (context, index) =>
                        Divider(color: context.colorScheme.outline),
              ),
            ),
          ),
        );
      },
    );
  }
}
