import 'package:shop/features/product/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      {required super.category,
      required super.imageUrl,
      required super.lable,
      required super.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        category: json['category'],
        imageUrl: json['imageUrl'],
        lable: json['lable'],
        price: json['price']);
  }
}
