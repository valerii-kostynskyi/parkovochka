import 'package:auto_route/auto_route.dart';
import 'package:parkovochka/presentation/home/home_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/'),
        // AutoRoute(page: CategoryRoute.page),
        // AutoRoute(page: SubcategoryRoute.page),
      ];
}
