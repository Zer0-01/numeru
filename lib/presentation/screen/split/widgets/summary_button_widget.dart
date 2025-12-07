import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/presentation/screen/split/bloc/split_bloc.dart';

class SummaryButtonWidget extends StatelessWidget {
  const SummaryButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplitBloc, SplitState>(
      builder: (context, state) {
        return SliverPadding(
          padding: EdgeInsetsGeometry.all(8),
          sliver: SliverToBoxAdapter(
            child: SafeArea(
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Summary"),
              ),
            ),
          ),
        );
      },
    );
  }
}
