import 'package:flutter/material.dart';

class AppBottomAppBarWidget extends StatelessWidget {
  final Widget? child;
  const AppBottomAppBarWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(child: child);
  }
}
