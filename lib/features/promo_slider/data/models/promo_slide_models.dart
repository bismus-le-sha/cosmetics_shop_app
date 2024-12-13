import 'package:shop/features/promo_slider/domain/entities/promo_slide_entity.dart';

class PromoSlideModel extends PromoSlideEntity {
  const PromoSlideModel(
      {required super.imageUrl,
      required super.discount,
      required super.title,
      required super.description,
      required super.buttonText});

  factory PromoSlideModel.fromJson(Map<String, dynamic> json) {
    return PromoSlideModel(
        imageUrl: json["imageUrl"],
        discount: json["discount"],
        title: json["title"],
        description: json["description"],
        buttonText: json["buttonText"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "imageUrl": imageUrl,
      "discount": discount,
      "title": title,
      "description": description,
      "buttonText": buttonText,
    };
  }
}
