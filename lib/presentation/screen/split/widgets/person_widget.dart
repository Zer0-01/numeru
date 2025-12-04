import 'package:flutter/material.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/common_widgets/app_text_field_widget.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(8),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainer,
          ),
          child: Column(
            children: [
              AppTextFieldWidget(label: "Name"),
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton(
                  onPressed: () {},
                  child: Text("Add Person"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
