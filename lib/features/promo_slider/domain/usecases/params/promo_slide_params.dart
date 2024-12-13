import 'package:equatable/equatable.dart';
import 'package:shop/features/promo_slider/data/models/promo_slide_models.dart';

class PromoSlideParams extends Equatable {
  final PromoSlideModel promoSlideModel;

  const PromoSlideParams({required this.promoSlideModel});

  @override
  List<Object?> get props => [promoSlideModel];
}
