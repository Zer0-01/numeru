import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/common_widgets/app_text_field_widget.dart';
import 'package:numeru/presentation/screen/split/bloc/split_bloc.dart';

class PersonWidget extends StatelessWidget {
  final TextEditingController nameController;
  const PersonWidget({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 4),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            spacing: 8,
            children: [
              AppTextFieldWidget(controller: nameController, label: "Name"),
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton(
                  onPressed: () {
                    context.read<SplitBloc>().add(
                      OnAddPersonEvent(name: nameController.text),
                    );
                    nameController.clear();
                  },
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
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
