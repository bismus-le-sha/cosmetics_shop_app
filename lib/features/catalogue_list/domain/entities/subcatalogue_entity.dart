import 'package:shop/features/product/domain/entities/product_entity.dart';

class SubcatalogueEntity {
  final String title;
  final String? appBarTitle;
  final List<ProductEntity> productList;

  SubcatalogueEntity({
    required this.title,
    this.appBarTitle,
    required this.productList,
  });
}
