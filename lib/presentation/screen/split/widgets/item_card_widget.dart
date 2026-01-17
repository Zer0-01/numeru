import 'package:flutter/material.dart';
import 'package:numeru/data/models/person_model.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/common_widgets/app_chip_widget.dart';
import 'package:numeru/presentation/common_widgets/app_text_field_widget.dart';

class ItemCardWidget extends StatelessWidget {
  final List<PersonModel> persons;

  const ItemCardWidget({super.key, required this.persons});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        spacing: 8,
        children: [
          const AppTextFieldWidget(),
          const AppTextFieldWidget(),
          Row(
            spacing: 8,
            children: [
              const Text("For:"),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 4,
                    children:
                        persons
                            .map(
                              (person) => AppChipWidget(
                                label: person.name,
                                onSelected: (_) {},
                                selected: true,
                              ),
                            )
                            .toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
