part of 'category_carousel_bloc.dart';

abstract class CategoryCarouselState extends Equatable {
  const CategoryCarouselState();

  @override
  List<Object> get props => [];
}

class CategoryCarouselInitial extends CategoryCarouselState {}

class CategoryCarouselLoading extends CategoryCarouselState {}

class CategoryCarouselLoaded extends CategoryCarouselState {
  final List<CategoryCarouselCardEntity> listCategoryCardEntity;

  const CategoryCarouselLoaded({required this.listCategoryCardEntity});

  @override
  List<Object> get props => [listCategoryCardEntity];
}

class CategoryCarouselFailure extends CategoryCarouselState {
  final String message;

  const CategoryCarouselFailure({required this.message});

  @override
  List<Object> get props => [message];
}
