// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [CartPage]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute({List<PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CartPage();
    },
  );
}

/// generated route for
/// [CatalogueNavigationPage]
class CatalogueNavigationRoute extends PageRouteInfo<void> {
  const CatalogueNavigationRoute({List<PageRouteInfo>? children})
      : super(
          CatalogueNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'CatalogueNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const CatalogueNavigationPage());
    },
  );
}

/// generated route for
/// [CataloguePage]
class CatalogueRoute extends PageRouteInfo<void> {
  const CatalogueRoute({List<PageRouteInfo>? children})
      : super(
          CatalogueRoute.name,
          initialChildren: children,
        );

  static const String name = 'CatalogueRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CataloguePage();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [StartPage]
class StartRoute extends PageRouteInfo<void> {
  const StartRoute({List<PageRouteInfo>? children})
      : super(
          StartRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StartPage();
    },
  );
}

/// generated route for
/// [SubcataloguePage]
class SubcatalogueRoute extends PageRouteInfo<SubcatalogueRouteArgs> {
  SubcatalogueRoute({
    Key? key,
    required List<SubcatalogueEntity> items,
    required String lable,
    List<PageRouteInfo>? children,
  }) : super(
          SubcatalogueRoute.name,
          args: SubcatalogueRouteArgs(
            key: key,
            items: items,
            lable: lable,
          ),
          initialChildren: children,
        );

  static const String name = 'SubcatalogueRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubcatalogueRouteArgs>();
      return SubcataloguePage(
        key: args.key,
        items: args.items,
        lable: args.lable,
      );
    },
  );
}

class SubcatalogueRouteArgs {
  const SubcatalogueRouteArgs({
    this.key,
    required this.items,
    required this.lable,
  });

  final Key? key;

  final List<SubcatalogueEntity> items;

  final String lable;

  @override
  String toString() {
    return 'SubcatalogueRouteArgs{key: $key, items: $items, lable: $lable}';
  }
}
