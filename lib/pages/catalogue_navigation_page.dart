import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/catalogue_list/presentation/bloc/catalogue_list_bloc.dart';
import '../injection_container.dart';

@RoutePage()
class CatalogueNavigationPage extends StatelessWidget
    implements AutoRouteWrapper {
  const CatalogueNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CatalogueListBloc>(),
      child: this,
    );
  }
}
