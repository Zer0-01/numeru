import 'package:flutter/material.dart';
import 'package:numeru/constant/constant.dart';
import 'package:numeru/main/app.dart';
import 'package:numeru/service/app_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
  final String locale =
      await asyncPrefs.getString(AppPreferencesKey.locale.name) ??
      LocaleEnum.en.value;

  await asyncPrefs.setString(AppPreferencesKey.locale.name, locale);

  runApp(App(locale: locale));
}
