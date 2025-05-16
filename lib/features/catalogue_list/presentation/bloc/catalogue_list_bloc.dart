import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/resources/consts.dart';
import 'package:shop/features/catalogue_list/domain/usecases/get_catalogue_list.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/catalogue_entity.dart';

part 'catalogue_list_event.dart';
part 'catalogue_list_state.dart';

class CatalogueListBloc extends Bloc<CatalogueListEvent, CatalogueListState> {
  final GetCatalogueList getCatalogueList;

  CatalogueListBloc({required this.getCatalogueList})
      : super(CatalogueListInitial()) {
    on<CatalogueListLoad>(_onCatalogueListLoad);
  }

  Future<void> _onCatalogueListLoad(
    CatalogueListLoad event,
    Emitter<CatalogueListState> emit,
  ) async {
    emit(CatalogueListLoading());

    final failureOrCatalogueList = await getCatalogueList(NoParams());

    failureOrCatalogueList.fold(
      (failure) =>
          emit(CatalogueListFailure(message: _mapFailureToMessage(failure))),
      (listCatalogueEntity) {
        emit(CatalogueListLoaded(listCatalogueEntity: listCatalogueEntity));
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
