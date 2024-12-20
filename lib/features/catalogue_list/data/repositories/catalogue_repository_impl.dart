import 'package:dartz/dartz.dart';
import 'package:shop/core/error/exceptions.dart';

import 'package:shop/core/error/failures.dart';
import 'package:shop/features/catalogue_list/data/datasources/catalogue_datasource.dart';

import 'package:shop/features/catalogue_list/domain/entities/catalogue_entity.dart';

import '../../domain/repositories/catalogue_repository.dart';

class CatalogueRepositoryImpl implements CatalogueRepository {
  final CatalogueDatasource catalogueDatasource;

  CatalogueRepositoryImpl({required this.catalogueDatasource});

  @override
  Future<Either<Failure, List<CatalogueEntity>>> getCatalogueList() async {
    try {
      final catalogueList = await catalogueDatasource.getMenuItems();
      return Right(catalogueList);
    } on ListEmptyException {
      return Left(Failure.fromType(FailureType.listEmpty));
    }
  }
}
