import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/injection_container.dart';
import 'package:flutter/material.dart';

import '../bloc/catalogue_list_bloc.dart';
import '../widgets/catalogue_list_display.dart';

@RoutePage()
class CataloguePage extends StatelessWidget {
  const CataloguePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = sl<CatalogueListBloc>();
    return BlocProvider(
      create: (_) {
        bloc.add(const CatalogueListLoad());
        return bloc;
      },
      child: BlocBuilder<CatalogueListBloc, CatalogueListState>(
        builder: (context, state) {
          if (state is CatalogueListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CatalogueListLoaded) {
            return CatalogueListDisplay(items: state.listCatalogueEntity);
          } else if (state is CatalogueListFailure) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
