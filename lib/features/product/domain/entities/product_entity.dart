import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String category;
  final String imageUrl;
  final String lable;
  final int price;

  const ProductEntity(
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
