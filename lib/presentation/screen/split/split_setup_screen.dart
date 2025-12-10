import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/presentation/screen/split/bloc/split_bloc.dart';
import 'package:numeru/presentation/screen/split/split_screen.dart';
import 'package:numeru/router/app_router.gr.dart';

@RoutePage()
class SplitSetupScreen extends StatelessWidget {
  const SplitSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplitBloc(),
      child: BlocListener<SplitBloc, SplitState>(
        listenWhen:
            (previous, current) => previous.splitStatus != current.splitStatus,
        listener: (context, state) {
          if (state.splitStatus == SplitStatus.success) {
            if (state.summaryModel == null) {
              return;
            }
            context.router.push(
              SplitSummarySetupRoute(summaryModel: state.summaryModel!),
            );
          }
        },
        child: const SplitScreen(),
      ),
    );
  }
}
