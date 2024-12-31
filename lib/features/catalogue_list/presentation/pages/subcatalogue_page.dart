import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/subcatalogue_entity.dart';

import '../widgets/subcatalogue_display.dart';

@RoutePage()
class SubcataloguePage extends StatelessWidget {
  final String lable;
  final List<SubcatalogueEntity> items;

  const SubcataloguePage({super.key, required this.items, required this.lable});

  @override
  Widget build(BuildContext context) {
    return SubcatalogueListDisplay(lable: lable, items: items);
  }
}
