import 'package:flutter/material.dart';
import 'package:shop/db.dart';
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
    SubcatalogueEntity(
        title: 'Жирная',
        appBarTitle: 'Средства для жирной кожи',
        productList: TestProduct.productList),
    SubcatalogueEntity(
        title: 'Комбинированая',
        appBarTitle: 'Средства для комбинированной кожи',
        productList: TestProduct.productList),
    SubcatalogueEntity(
        title: 'Нормальная',
        appBarTitle: 'Средства для нормальной кожи',
        productList: TestProduct.productList),
    SubcatalogueEntity(
        title: 'Сухая',
        appBarTitle: 'Средства для сухой кожи',
        productList: TestProduct.productList),
    SubcatalogueEntity(
        title: 'Любой тип',
        appBarTitle: 'Средства для любого типа кожи',
        productList: TestProduct.productList),
  ];

  List<SubcatalogueEntity> stubItems = [
    SubcatalogueEntity(
        title: 'Уход за волосами', productList: TestProduct.productList),
    SubcatalogueEntity(
        title: 'Уход за лицом', productList: TestProduct.productList),
    SubcatalogueEntity(
        title: 'Уход за телом', productList: TestProduct.productList),
    SubcatalogueEntity(
        title: 'Все для макияжа', productList: TestProduct.productList),
    SubcatalogueEntity(
        title: 'Все продукты', productList: TestProduct.productList),
  ];
}
