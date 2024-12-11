import 'package:shop/features/promo_slider/domain/entities/promo_slide_entity.dart';

class PromoSlideModels extends PromoSlideEntity {
  const PromoSlideModels(
      {required super.imageUrl,
      required super.discount,
      required super.title,
      required super.description,
      required super.buttonText});

  factory PromoSlideModels.fromJson(Map<String, dynamic> json) {
    return PromoSlideModels(
        imageUrl: json["imageUrl"],
        discount: json["discount"],
        title: json["title"],
        description: json["description"],
        buttonText: json["buttonText"]);
  }
}
