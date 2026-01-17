import 'package:flutter/material.dart';

class AppSwitchWidget extends StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;
  const AppSwitchWidget({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(value: value, onChanged: onChanged);
  }
}
