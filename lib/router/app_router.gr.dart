// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:numeru/data/models/split_summary_model.dart' as _i10;
import 'package:numeru/presentation/screen/home/home_setup_screen.dart' as _i3;
import 'package:numeru/presentation/screen/settings/language/language_setup_screen.dart'
    as _i4;
import 'package:numeru/presentation/screen/settings/settings_setup_screen.dart'
    as _i5;
import 'package:numeru/presentation/screen/split/equal_split/equal_split_screen.dart'
    as _i1;
import 'package:numeru/presentation/screen/split/equal_split/equal_split_setup_screen.dart'
    as _i2;
import 'package:numeru/presentation/screen/split/split_setup_screen.dart'
    as _i6;
import 'package:numeru/presentation/screen/split_summary/split_summary_screen.dart'
    as _i7;

/// generated route for
/// [_i1.EqualSplitScreen]
class EqualSplitRoute extends _i8.PageRouteInfo<void> {
  const EqualSplitRoute({List<_i8.PageRouteInfo>? children})
    : super(EqualSplitRoute.name, initialChildren: children);

  static const String name = 'EqualSplitRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.EqualSplitScreen();
    },
  );
}

/// generated route for
/// [_i2.EqualSplitSetupScreen]
class EqualSplitSetupRoute extends _i8.PageRouteInfo<void> {
  const EqualSplitSetupRoute({List<_i8.PageRouteInfo>? children})
    : super(EqualSplitSetupRoute.name, initialChildren: children);

  static const String name = 'EqualSplitSetupRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.EqualSplitSetupScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeSetupScreen]
class HomeSetupRoute extends _i8.PageRouteInfo<void> {
  const HomeSetupRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeSetupRoute.name, initialChildren: children);

  static const String name = 'HomeSetupRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeSetupScreen();
    },
  );
}

/// generated route for
/// [_i4.LanguageSetupScreen]
class LanguageSetupRoute extends _i8.PageRouteInfo<void> {
  const LanguageSetupRoute({List<_i8.PageRouteInfo>? children})
    : super(LanguageSetupRoute.name, initialChildren: children);

  static const String name = 'LanguageSetupRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.LanguageSetupScreen();
    },
  );
}

/// generated route for
/// [_i5.SettingsSetupScreen]
class SettingsSetupRoute extends _i8.PageRouteInfo<void> {
  const SettingsSetupRoute({List<_i8.PageRouteInfo>? children})
    : super(SettingsSetupRoute.name, initialChildren: children);

  static const String name = 'SettingsSetupRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.SettingsSetupScreen();
    },
  );
}

/// generated route for
/// [_i6.SplitSetupScreen]
class SplitSetupRoute extends _i8.PageRouteInfo<void> {
  const SplitSetupRoute({List<_i8.PageRouteInfo>? children})
    : super(SplitSetupRoute.name, initialChildren: children);

  static const String name = 'SplitSetupRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.SplitSetupScreen();
    },
  );
}

/// generated route for
/// [_i7.SplitSummaryScreen]
class SplitSummaryRoute extends _i8.PageRouteInfo<SplitSummaryRouteArgs> {
  SplitSummaryRoute({
    _i9.Key? key,
    required _i10.SplitSummaryModel summary,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         SplitSummaryRoute.name,
         args: SplitSummaryRouteArgs(key: key, summary: summary),
         initialChildren: children,
       );

  static const String name = 'SplitSummaryRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SplitSummaryRouteArgs>();
      return _i7.SplitSummaryScreen(key: args.key, summary: args.summary);
    },
  );
}

class SplitSummaryRouteArgs {
  const SplitSummaryRouteArgs({this.key, required this.summary});

  final _i9.Key? key;

  final _i10.SplitSummaryModel summary;

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
