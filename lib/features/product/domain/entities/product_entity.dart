import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String category;
  final String imageUrl;
  final String lable;
  final int price;
  final int? oldPrice;
  final List<String>? promotions;

  const ProductEntity(this.oldPrice, this.promotions,
      {required this.category,
      required this.imageUrl,
      required this.lable,
      required this.price});

  @override
  List<Object?> get props => [
        category,
        imageUrl,
        lable,
        price,
      ];
}
