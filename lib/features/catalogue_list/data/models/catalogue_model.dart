import 'package:shop/features/catalogue_list/domain/entities/catalogue_entity.dart';

class CatalogueModel extends CatalogueEntity {
  CatalogueModel(
      {required super.title,
      super.icon,
      super.appBarTitile,
      required super.items});
}
