import 'package:shop/features/product/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    int? oldPrice,
    List<String>? promotions,
    required String category,
    required String imageUrl,
    required String lable,
    required int price,
  }) : super(
          oldPrice,
          promotions,
          category: category,
          imageUrl: imageUrl,
          lable: lable,
          price: price,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        oldPrice: json['currentPrice'] != null
            ? int.parse(json['currentPrice'])
            : null,
        promotions: json['promotions'] != null
            ? List<String>.from(json['promotions'])
            : null,
        category: json['category'],
        imageUrl: json['imageUrl'],
        lable: json['lable'],
        price: json['price']);
  }
}
