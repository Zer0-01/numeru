import 'package:flutter/material.dart';
import 'package:numeru/extensions/context_extension.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          fillColor: context.colorScheme.primaryContainer,
          hintText: "Search tools...",
          hintStyle: TextStyle(color: context.colorScheme.onPrimaryContainer),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: context.colorScheme.primary),
          ),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
