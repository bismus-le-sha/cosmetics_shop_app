import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shop/widgets/custom_nav_bar.dart';

import '../config/router/router.dart';

@RoutePage()
class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        CatalogueRoute(),
        CartRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
            body: child,
            bottomNavigationBar: CustomNavBar(
                currentIndex: tabsRouter.activeIndex,
                onTap: tabsRouter.setActiveIndex));
      },
    );
  }
}
