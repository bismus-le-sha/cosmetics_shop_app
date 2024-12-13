import 'package:dartz/dartz.dart';
import 'package:shop/core/error/exceptions.dart';

import 'package:shop/core/error/failures.dart';
import 'package:shop/features/promo_slider/data/datasources/local_promo_slide_data_source.dart';
import 'package:shop/features/promo_slider/data/datasources/remote_promo_slide_data_source.dart';

import 'package:shop/features/promo_slider/domain/entities/promo_slide_entity.dart';

import '../../../../core/util/network.dart';
import '../../domain/repositories/promo_slide_repository.dart';

class PromoSlideRepositoryImpl implements PromoSlideRepository {
  final RemotePromoSlideDataSource remoteDataSource;
  final LocalPromoSlideDataSource localDataSource;
  final NetworkInfo networkInfo;

  PromoSlideRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PromoSlideEntity>>> getPromoSlides() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePromoSlides = await remoteDataSource.getPromoSlides();

        localDataSource.cachePromoSlides(remotePromoSlides);

        return Right(remotePromoSlides);
      } on ServerException {
        return Left(Failure.fromType(FailureType.serverError));
      }
    } else {
      try {
        final localPromoSlides = await localDataSource.getLastPromoSlides();

        return Right(localPromoSlides);
      } on CacheException {
        return Left(Failure.fromType(FailureType.cacheError));
      }
    }
  }
}
