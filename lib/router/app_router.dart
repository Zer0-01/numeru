import 'package:auto_route/auto_route.dart';
import 'package:numeru/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeSetupRoute.page, path: '/', initial: true),
    AutoRoute(page: SplitSetupRoute.page, path: '/split'),
    AutoRoute(page: SplitSummarySetupRoute.page, path: '/summary'),
    AutoRoute(page: SettingsSetupRoute.page, path: '/settings'),
    AutoRoute(page: LanguageSetupRoute.page, path: '/language'),
  ];
}
