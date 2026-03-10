import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/common_widgets/app_app_bar_widget.dart';
import 'package:numeru/presentation/common_widgets/app_bottom_app_bar_widget.dart';
import 'package:numeru/presentation/common_widgets/buttons/app_filled_button_widget.dart';
import 'package:numeru/presentation/screen/split/widgets/item_list_widget.dart';
import 'package:numeru/presentation/screen/split/widgets/receipt_settings_widget.dart';
import 'package:numeru/presentation/screen/split/widgets/who_is_paying_widget.dart';
import 'package:numeru/router/app_router.gr.dart';
import 'package:numeru/presentation/screen/split/bloc/split_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplitScreen extends StatelessWidget {
  const SplitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplitBloc, SplitState>(
      listenWhen:
          (previous, current) =>
              previous.summaryModel == null && current.summaryModel != null,
      listener: (context, state) {
        if (state.summaryModel != null) {
          context.router.push(SplitSummaryRoute(summary: state.summaryModel!));
        }
      },
      child: BlocBuilder<SplitBloc, SplitState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppAppBarWidget.back(
              onPressedBack: () => context.router.maybePop(),
              title: "Split",
            ),
            body: const CustomScrollView(
              slivers: [
                WhoIsPayingWidget(),
                ItemListWidget(),
                ReceiptSettingsWidget(),
              ],
            ),
            bottomNavigationBar: AppBottomAppBarWidget(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Split between"),
                        Text(
                          "${state.peopleModel.length} People",
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: AppFilledButtonWidget(
                      label: "Split",
                      onPressed: () {
                        context.read<SplitBloc>().add(
                          const OnCalculateSplitEvent(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
