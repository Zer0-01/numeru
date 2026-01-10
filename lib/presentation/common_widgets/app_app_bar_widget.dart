import 'package:flutter/material.dart';
import 'package:numeru/extensions/context_extension.dart';

class AppAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? titleTextStyle;
  final List<Widget>? actions;
  final IconThemeData? actionsIconTheme;
  final EdgeInsetsGeometry? actionsPadding;
  final bool isBack;
  final void Function()? onPressedBack;

  const AppAppBarWidget({
    super.key,
    this.title = '',
    this.titleTextStyle,
    this.actions,
    this.actionsIconTheme,
    this.actionsPadding,
    this.isBack = false,
    this.onPressedBack,
  });

  const AppAppBarWidget.back({
    super.key,
    this.title = '',
    this.titleTextStyle,
    this.actions,
    this.actionsIconTheme,
    this.actionsPadding,
    required this.onPressedBack,
  }) : isBack = true;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
          isBack
              ? IconButton(
                onPressed: onPressedBack,
                icon: const Icon(Icons.chevron_left),
              )
              : null,
      title: title.isNotEmpty ? Text(title) : null,
      titleTextStyle:
          titleTextStyle ??
          context.theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
      actions: actions,
      actionsIconTheme: actionsIconTheme,
      actionsPadding: actionsPadding ?? const EdgeInsets.only(right: 16),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
