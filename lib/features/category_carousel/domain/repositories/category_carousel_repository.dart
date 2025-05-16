import 'package:dartz/dartz.dart';
import 'package:shop/core/error/failures.dart';
import 'package:shop/features/category_carousel/domain/entities/category_carousel_card_entity.dart';

abstract class CategoryCarouselRepository {
  Future<Either<Failure, List<CategoryCarouselCardEntity>>>
      getCategoryCarousel();
}
