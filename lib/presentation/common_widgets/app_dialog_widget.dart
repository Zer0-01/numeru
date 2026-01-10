import 'package:flutter/material.dart';
import 'package:numeru/presentation/common_widgets/buttons/app_filled_button_widget.dart';

class AppDialogWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? topButtonLabel;
  final void Function()? onPressedTopButton;

  const AppDialogWidget({
    super.key,
    this.title,
    this.subtitle,
    this.topButtonLabel,
    this.onPressedTopButton,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null) Text(title ?? ""),
            if (subtitle != null) Text(subtitle ?? ""),
            if (topButtonLabel != null && onPressedTopButton != null)
              AppFilledButtonWidget(
                label: "Add",
                onPressed: onPressedTopButton,
              ),
          ],
        ),
      ),
    );
  }
}
