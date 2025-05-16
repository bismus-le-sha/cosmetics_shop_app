import 'package:dartz/dartz.dart';
import 'package:shop/core/error/failures.dart';
import 'package:shop/core/usecase/usecase.dart';
import 'package:shop/features/category_carousel/domain/entities/category_carousel_card_entity.dart';
import 'package:shop/features/category_carousel/domain/repositories/category_carousel_repository.dart';

class GetCategoryCardList
    implements UseCase<List<CategoryCarouselCardEntity>, NoParams> {
  final CategoryCarouselRepository repository;

  GetCategoryCardList(this.repository);

  @override
  Future<Either<Failure, List<CategoryCarouselCardEntity>>> call(
      NoParams params) async {
    return await repository.getCategoryCarousel();
  }
}
