import 'package:flutter/material.dart';
import 'package:numeru/l10n/app_localizations.dart';

extension ContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
