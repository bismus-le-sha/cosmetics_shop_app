import 'package:dartz/dartz.dart';
import 'package:shop/features/promo_slider/domain/entities/promo_slide_entity.dart';

import '../../../../core/error/failures.dart';

abstract class PromoSlideRepository {
  Future<Either<Failure, List<PromoSlideEntity>>> getPromoSlides();
}
