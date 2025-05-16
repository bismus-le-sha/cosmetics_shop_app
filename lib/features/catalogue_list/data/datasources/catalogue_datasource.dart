import 'package:flutter/material.dart';
import 'package:shop/features/catalogue_list/domain/entities/catalogue_entity.dart';

import '../../domain/entities/subcatalogue_entity.dart';

abstract class CatalogueDatasource {
  Future<List<CatalogueEntity>> getMenuItems();
}

class CatalogueDatasourceImpl implements CatalogueDatasource {
  @override
  Future<List<CatalogueEntity>> getMenuItems() async {
    // Simulate a network call or data fetching
    await Future.delayed(const Duration(seconds: 1));

    return [
      CatalogueEntity(
          title: 'Назначение', appBarTitile: 'По назначению', items: stubItems),
      CatalogueEntity(
          title: 'Тип средства',
          appBarTitile: 'По типу средства',
          items: stubItems),
      CatalogueEntity(
          title: 'Тип кожи',
          appBarTitile: 'По типу кожи',
          items: skinTypeItems),
      CatalogueEntity(title: 'Линия косметики', items: stubItems),
      CatalogueEntity(title: 'Наборы', items: stubItems),
      CatalogueEntity(
          title: 'Акции', icon: Icons.local_offer, items: stubItems),
      CatalogueEntity(title: 'Консультация с косметологом', items: stubItems),
    ];
  }

  List<SubcatalogueEntity> skinTypeItems = [
    SubcatalogueEntity(title: 'Жирная'),
    SubcatalogueEntity(title: 'Комбинированая'),
    SubcatalogueEntity(title: 'Нормальная'),
    SubcatalogueEntity(title: 'Сухая'),
    SubcatalogueEntity(title: 'Любой тип'),
  ];

  List<SubcatalogueEntity> stubItems = [
    SubcatalogueEntity(title: 'Уход за волосами'),
    SubcatalogueEntity(title: 'Уход за лицом'),
    SubcatalogueEntity(title: 'Уход за телом'),
    SubcatalogueEntity(title: 'Все для макияжа'),
    SubcatalogueEntity(title: 'Все продукты'),
  ];
}
