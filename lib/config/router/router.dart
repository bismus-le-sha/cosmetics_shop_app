import 'package:auto_route/auto_route.dart';

import '../../pages/cart.dart';
import '../../features/catalogue_list/presentation/pages/catalogue_page.dart';
import '../../pages/home_page.dart';
import '../../pages/profile.dart';
import '../../pages/start_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: StartRoute.page, initial: true, children: [
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: CatalogueRoute.page),
          AutoRoute(page: CartRoute.page),
          AutoRoute(page: ProfileRoute.page)
        ]),
      ];
}
