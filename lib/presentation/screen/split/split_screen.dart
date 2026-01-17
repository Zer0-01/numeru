import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/common_widgets/app_app_bar_widget.dart';
import 'package:numeru/presentation/common_widgets/app_bottom_app_bar_widget.dart';
import 'package:numeru/presentation/common_widgets/buttons/app_filled_button_widget.dart';
import 'package:numeru/presentation/screen/split/widgets/item_list_widget.dart';
import 'package:numeru/presentation/screen/split/widgets/receipt_settings_widget.dart';
import 'package:numeru/presentation/screen/split/widgets/who_is_paying_widget.dart';

class SplitScreen extends StatelessWidget {
  const SplitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarWidget.back(
        onPressedBack: () => context.router.maybePop(),
        title: "Split",
      ),

      body: const CustomScrollView(
        slivers: [
          WhoIsPayingWidget(),
          ReceiptSettingsWidget(),
          ItemListWidget(),
        ],
      ),
      bottomNavigationBar: AppBottomAppBarWidget(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Split between"),
                  Text(
                    "3 People",
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: AppFilledButtonWidget(label: "Split", onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
