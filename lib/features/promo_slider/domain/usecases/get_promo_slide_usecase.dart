import 'package:dartz/dartz.dart';
import 'package:shop/core/error/failures.dart';
import 'package:shop/core/usecase/usecase.dart';
import 'package:shop/features/promo_slider/domain/entities/promo_slide_entity.dart';
import 'package:shop/features/promo_slider/domain/repositories/promo_slide_repository.dart';

class GetPromoSlides implements UseCase<List<PromoSlideEntity>, NoParams> {
  final PromoSlideRepository repository;

  GetPromoSlides(this.repository);

  @override
  Future<Either<Failure, List<PromoSlideEntity>>> call(NoParams params) async {
    return await repository.getPromoSlides();
  }
}
