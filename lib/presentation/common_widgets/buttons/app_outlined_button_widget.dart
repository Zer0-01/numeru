import 'package:flutter/material.dart';

class AppOutlinedButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const AppOutlinedButtonWidget({
    super.key,
    this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onPressed, child: Text(label));
  }
}
