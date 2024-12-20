import 'package:dartz/dartz.dart';
import 'package:shop/core/error/failures.dart';
import 'package:shop/core/usecase/usecase.dart';
import 'package:shop/features/catalogue_list/domain/entities/catalogue_entity.dart';

import '../repositories/catalogue_repository.dart';

class GetCatalogueList implements UseCase<List<CatalogueEntity>, NoParams> {
  final CatalogueRepository repository;

  GetCatalogueList(this.repository);

  @override
  Future<Either<Failure, List<CatalogueEntity>>> call(NoParams params) async {
    return await repository.getCatalogueList();
  }
}
