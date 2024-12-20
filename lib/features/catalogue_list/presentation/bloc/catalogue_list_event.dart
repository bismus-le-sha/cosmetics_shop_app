part of 'catalogue_list_bloc.dart';

abstract class CatalogueListEvent extends Equatable {
  const CatalogueListEvent();

  @override
  List<Object> get props => [];
}

class CatalogueListLoad extends CatalogueListEvent {
  const CatalogueListLoad();

  @override
  List<Object> get props => [];
}
