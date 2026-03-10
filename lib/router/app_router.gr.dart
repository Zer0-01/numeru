// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:numeru/data/models/split_summary_model.dart' as _i8;
import 'package:numeru/presentation/screen/home/home_setup_screen.dart' as _i1;
import 'package:numeru/presentation/screen/settings/language/language_setup_screen.dart'
    as _i2;
import 'package:numeru/presentation/screen/settings/settings_setup_screen.dart'
    as _i3;
import 'package:numeru/presentation/screen/split/split_setup_screen.dart'
    as _i4;
import 'package:numeru/presentation/screen/split_summary/split_summary_screen.dart'
    as _i5;

/// generated route for
/// [_i1.HomeSetupScreen]
class HomeSetupRoute extends _i6.PageRouteInfo<void> {
  const HomeSetupRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeSetupRoute.name, initialChildren: children);

  static const String name = 'HomeSetupRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeSetupScreen();
    },
  );
}

/// generated route for
/// [_i2.LanguageSetupScreen]
class LanguageSetupRoute extends _i6.PageRouteInfo<void> {
  const LanguageSetupRoute({List<_i6.PageRouteInfo>? children})
    : super(LanguageSetupRoute.name, initialChildren: children);

  static const String name = 'LanguageSetupRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.LanguageSetupScreen();
    },
  );
}

/// generated route for
/// [_i3.SettingsSetupScreen]
class SettingsSetupRoute extends _i6.PageRouteInfo<void> {
  const SettingsSetupRoute({List<_i6.PageRouteInfo>? children})
    : super(SettingsSetupRoute.name, initialChildren: children);

  static const String name = 'SettingsSetupRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.SettingsSetupScreen();
    },
  );
}

/// generated route for
/// [_i4.SplitSetupScreen]
class SplitSetupRoute extends _i6.PageRouteInfo<void> {
  const SplitSetupRoute({List<_i6.PageRouteInfo>? children})
    : super(SplitSetupRoute.name, initialChildren: children);

  static const String name = 'SplitSetupRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplitSetupScreen();
    },
  );
}

/// generated route for
/// [_i5.SplitSummaryScreen]
class SplitSummaryRoute extends _i6.PageRouteInfo<SplitSummaryRouteArgs> {
  SplitSummaryRoute({
    _i7.Key? key,
    required _i8.SplitSummaryModel summary,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         SplitSummaryRoute.name,
         args: SplitSummaryRouteArgs(key: key, summary: summary),
         initialChildren: children,
       );

  static const String name = 'SplitSummaryRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SplitSummaryRouteArgs>();
      return _i5.SplitSummaryScreen(key: args.key, summary: args.summary);
    },
  );
}

class SplitSummaryRouteArgs {
  const SplitSummaryRouteArgs({this.key, required this.summary});

  final _i7.Key? key;

  final _i8.SplitSummaryModel summary;

  @override
  String toString() {
    return 'SplitSummaryRouteArgs{key: $key, summary: $summary}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SplitSummaryRouteArgs) return false;
    return key == other.key && summary == other.summary;
  }

  @override
  int get hashCode => key.hashCode ^ summary.hashCode;
}
