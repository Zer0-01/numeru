// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:numeru/data/models/summary_model.dart' as _i6;
import 'package:numeru/presentation/screen/home/home_setup_screen.dart' as _i1;
import 'package:numeru/presentation/screen/split/split_setup_screen.dart'
    as _i2;
import 'package:numeru/presentation/screen/split/split_summary/split_summary_setup_screen.dart'
    as _i3;

/// generated route for
/// [_i1.HomeSetupScreen]
class HomeSetupRoute extends _i4.PageRouteInfo<void> {
  const HomeSetupRoute({List<_i4.PageRouteInfo>? children})
    : super(HomeSetupRoute.name, initialChildren: children);

  static const String name = 'HomeSetupRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeSetupScreen();
    },
  );
}

/// generated route for
/// [_i2.SplitSetupScreen]
class SplitSetupRoute extends _i4.PageRouteInfo<void> {
  const SplitSetupRoute({List<_i4.PageRouteInfo>? children})
    : super(SplitSetupRoute.name, initialChildren: children);

  static const String name = 'SplitSetupRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.SplitSetupScreen();
    },
  );
}

/// generated route for
/// [_i3.SplitSummarySetupScreen]
class SplitSummarySetupRoute
    extends _i4.PageRouteInfo<SplitSummarySetupRouteArgs> {
  SplitSummarySetupRoute({
    _i5.Key? key,
    required _i6.SummaryModel summaryModel,
    List<_i4.PageRouteInfo>? children,
  }) : super(
         SplitSummarySetupRoute.name,
         args: SplitSummarySetupRouteArgs(key: key, summaryModel: summaryModel),
         initialChildren: children,
       );

  static const String name = 'SplitSummarySetupRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SplitSummarySetupRouteArgs>();
      return _i3.SplitSummarySetupScreen(
        key: args.key,
        summaryModel: args.summaryModel,
      );
    },
  );
}

class SplitSummarySetupRouteArgs {
  const SplitSummarySetupRouteArgs({this.key, required this.summaryModel});

  final _i5.Key? key;

  final _i6.SummaryModel summaryModel;

  @override
  String toString() {
    return 'SplitSummarySetupRouteArgs{key: $key, summaryModel: $summaryModel}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SplitSummarySetupRouteArgs) return false;
    return key == other.key && summaryModel == other.summaryModel;
  }

  @override
  int get hashCode => key.hashCode ^ summaryModel.hashCode;
}
