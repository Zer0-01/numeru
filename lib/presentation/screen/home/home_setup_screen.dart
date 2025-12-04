import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:numeru/presentation/screen/home/home_screen.dart';

@RoutePage()
class HomeSetupScreen extends StatelessWidget {
  const HomeSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
