import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/screen/split/bloc/split_bloc.dart';

class PersonWidget extends StatelessWidget {
  final TextEditingController nameController;
  const PersonWidget({super.key, required this.nameController});

  bool _isButtonEnabled() {
    return nameController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            spacing: 8,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: context.colorScheme.surfaceContainerLow,
                  hintText: "Name",
                  hintStyle: TextStyle(
                    color: context.colorScheme.surfaceContainer,
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: context.colorScheme.primary),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton(
                  onPressed:
                      _isButtonEnabled()
                          ? () {
                            context.read<SplitBloc>().add(
                              OnAddPersonEvent(name: nameController.text),
                            );
                            nameController.clear();
                          }
                          : null,
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
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
