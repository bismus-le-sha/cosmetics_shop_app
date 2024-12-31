import 'package:flutter/material.dart';
import 'package:shop/features/catalogue_list/domain/entities/subcatalogue_entity.dart';

class CatalogueEntity {
  final String title;
  final IconData? icon;
  final String? appBarTitile;
  final List<SubcatalogueEntity> items;

  CatalogueEntity({
    required this.title,
    this.icon,
    this.appBarTitile,
    required this.items,
  });
}
