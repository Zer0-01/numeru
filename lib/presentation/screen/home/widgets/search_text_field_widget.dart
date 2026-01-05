import 'package:flutter/material.dart';
import 'package:numeru/extensions/context_extension.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
      child: TextFormField(
        decoration: InputDecoration(hintText: context.l10n.search_with_dots),
      ),
    );
  }
}
