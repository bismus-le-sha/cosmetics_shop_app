part of 'catalogue_list_bloc.dart';

abstract class CatalogueListState extends Equatable {
  const CatalogueListState();

  @override
  List<Object> get props => [];
}

class CatalogueListInitial extends CatalogueListState {}

class CatalogueListLoading extends CatalogueListState {}

class CatalogueListLoaded extends CatalogueListState {
  final List<CatalogueEntity> listCatalogueEntity;

  const CatalogueListLoaded({required this.listCatalogueEntity});

  @override
  List<Object> get props => [listCatalogueEntity];
}

class CatalogueListFailure extends CatalogueListState {
  final String message;

  const CatalogueListFailure({required this.message});

  @override
  List<Object> get props => [message];
}
