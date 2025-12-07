import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/presentation/screen/split/bloc/split_bloc.dart';
import 'package:numeru/presentation/screen/split/split_screen.dart';

@RoutePage()
class SplitSetupScreen extends StatelessWidget {
  const SplitSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplitBloc(),
      child: const SplitScreen(),
    );
  }
}
