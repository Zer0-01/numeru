import 'package:auto_route/auto_route.dart';
import 'package:numeru/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeSetupRoute.page, path: '/', initial: true),
  ];
}
