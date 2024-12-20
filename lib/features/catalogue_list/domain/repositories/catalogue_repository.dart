import 'package:dartz/dartz.dart';
import 'package:shop/features/catalogue_list/domain/entities/catalogue_entity.dart';

import '../../../../core/error/failures.dart';

abstract class CatalogueRepository {
  Future<Either<Failure, List<CatalogueEntity>>> getCatalogueList();
}
