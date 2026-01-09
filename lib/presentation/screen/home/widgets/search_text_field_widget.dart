import 'package:flutter/material.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/common_widgets/app_text_field_widget.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
      child: AppTextFieldWidget(
        fillColor: context.theme.colorScheme.surfaceContainerLowest,
        hint: context.l10n.search_with_dots,
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
