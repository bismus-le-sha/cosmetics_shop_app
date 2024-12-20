import 'package:flutter/material.dart';
import 'package:shop/features/catalogue_list/domain/entities/catalogue_entity.dart';

abstract class CatalogueDatasource {
  Future<List<CatalogueEntity>> getMenuItems();
}

class CatalogueDatasourceImpl implements CatalogueDatasource {
  @override
  Future<List<CatalogueEntity>> getMenuItems() async {
    return [
      CatalogueEntity(title: 'Назначение'),
      CatalogueEntity(title: 'Тип средства'),
      CatalogueEntity(title: 'Тип кожи'),
      CatalogueEntity(title: 'Линия косметики'),
      CatalogueEntity(title: 'Наборы'),
      CatalogueEntity(title: 'Акции', icon: Icons.local_offer),
      CatalogueEntity(title: 'Консультация с косметологом'),
    ];
  }
}
