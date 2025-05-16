import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/error/failures.dart';
import 'package:shop/core/resources/consts.dart';
import 'package:shop/core/usecase/usecase.dart';
import 'package:shop/features/category_carousel/domain/entities/category_carousel_card_entity.dart';
import 'package:shop/features/category_carousel/domain/usecases/get_category_card_list.dart';

part 'category_carousel_event.dart';
part 'category_carousel_state.dart';

class CategoryCarouselBloc
    extends Bloc<CategoryCarouselEvent, CategoryCarouselState> {
  final GetCategoryCardList getCategoryCardList;

  CategoryCarouselBloc({required this.getCategoryCardList})
      : super(CategoryCarouselInitial()) {
    on<CategoryCarouselLoad>(_onCategoryCarouselLoad);
  }

  Future<void> _onCategoryCarouselLoad(
    CategoryCarouselLoad event,
    Emitter<CategoryCarouselState> emit,
  ) async {
    emit(CategoryCarouselLoading());

    final failureOrCategoryCardList = await getCategoryCardList(NoParams());

    failureOrCategoryCardList.fold(
      (failure) =>
          emit(CategoryCarouselFailure(message: _mapFailureToMessage(failure))),
      (listCategoryCardEntity) {
        emit(CategoryCarouselLoaded(
            listCategoryCardEntity: listCategoryCardEntity));
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure.type case FailureType.serverError) {
      return LIST_EMPTY_FAILURE;
    }
    return UNIDENTIFIED_FAILURE;
  }
}
