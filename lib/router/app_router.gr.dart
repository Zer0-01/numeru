// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:numeru/presentation/screen/home/home_setup_screen.dart' as _i1;
import 'package:numeru/presentation/screen/settings/language/language_setup_screen.dart'
    as _i2;
import 'package:numeru/presentation/screen/settings/settings_setup_screen.dart'
    as _i3;
import 'package:numeru/presentation/screen/split/split_setup_screen.dart'
    as _i4;

/// generated route for
/// [_i1.HomeSetupScreen]
class HomeSetupRoute extends _i5.PageRouteInfo<void> {
  const HomeSetupRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeSetupRoute.name, initialChildren: children);

  static const String name = 'HomeSetupRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeSetupScreen();
    },
  );
}

/// generated route for
/// [_i2.LanguageSetupScreen]
class LanguageSetupRoute extends _i5.PageRouteInfo<void> {
  const LanguageSetupRoute({List<_i5.PageRouteInfo>? children})
    : super(LanguageSetupRoute.name, initialChildren: children);

  static const String name = 'LanguageSetupRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.LanguageSetupScreen();
    },
  );
}

/// generated route for
/// [_i3.SettingsSetupScreen]
class SettingsSetupRoute extends _i5.PageRouteInfo<void> {
  const SettingsSetupRoute({List<_i5.PageRouteInfo>? children})
    : super(SettingsSetupRoute.name, initialChildren: children);

  static const String name = 'SettingsSetupRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.SettingsSetupScreen();
    },
  );
}

/// generated route for
/// [_i4.SplitSetupScreen]
class SplitSetupRoute extends _i5.PageRouteInfo<void> {
  const SplitSetupRoute({List<_i5.PageRouteInfo>? children})
    : super(SplitSetupRoute.name, initialChildren: children);

  static const String name = 'SplitSetupRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplitSetupScreen();
    },
  );
}
