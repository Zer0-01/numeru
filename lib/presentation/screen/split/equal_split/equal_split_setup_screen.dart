import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/presentation/screen/split/equal_split/bloc/equal_split_bloc.dart';
import 'package:numeru/presentation/screen/split/equal_split/equal_split_screen.dart';

@RoutePage()
class EqualSplitSetupScreen extends StatelessWidget {
  const EqualSplitSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EqualSplitBloc(),
      child: const EqualSplitScreen(),
    );
  }
}
