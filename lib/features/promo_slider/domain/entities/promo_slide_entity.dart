import 'package:equatable/equatable.dart';

class PromoSlideEntity extends Equatable {
  final String imageUrl;
  final String discount;
  final String title;
  final String description;
  final String buttonText;

  const PromoSlideEntity({
    required this.imageUrl,
    required this.discount,
    required this.title,
    required this.description,
    required this.buttonText,
  });

  @override
  List<Object?> get props =>
      [imageUrl, discount, title, description, buttonText];
}
