import 'package:flutter/material.dart';

class AppFilledButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const AppFilledButtonWidget({super.key, this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return FilledButton(onPressed: onPressed, child: Text(label));
  }
}
