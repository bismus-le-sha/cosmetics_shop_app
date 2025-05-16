import 'package:dartz/dartz.dart';
import 'package:shop/core/error/exceptions.dart';
import 'package:shop/core/error/failures.dart';
import 'package:shop/features/category_carousel/data/datasources/category_carousel_datasource.dart';
import 'package:shop/features/category_carousel/domain/entities/category_carousel_card_entity.dart';
import 'package:shop/features/category_carousel/domain/repositories/category_carousel_repository.dart';

class CategoryCarouselRepositoryImpl implements CategoryCarouselRepository {
  final CategoryCarouselDatasource dataSource;

  CategoryCarouselRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<CategoryCarouselCardEntity>>>
      getCategoryCarousel() async {
    try {
      final result = await dataSource.getCategoryCarousel();
      return Right(result);
    } on ListEmptyException {
      return Left(Failure.fromType(FailureType.listEmpty));
    }
  }
}
