import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/usecase/usecase.dart';
import 'package:shop/features/promo_slider/domain/entities/promo_slide_entity.dart';
import 'package:shop/features/promo_slider/domain/usecases/get_promo_slide_usecase.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/resources/consts.dart';

part 'promo_slider_event.dart';
part 'promo_slider_state.dart';

class PromoSliderBloc extends Bloc<PromoSliderEvent, PromoSliderState> {
  final GetPromoSlides getPromoSlides;

  PromoSliderBloc({required this.getPromoSlides})
      : super(PromoSliderInitial()) {
    on<PromoSliderLoad>(_onPromoSlideLoad);
  }

  Future<void> _onPromoSlideLoad(
    PromoSliderLoad event,
    Emitter<PromoSliderState> emit,
  ) async {
    emit(PromoSliderLoading());

    final failureOrPromoSlide = await getPromoSlides(NoParams());

    failureOrPromoSlide.fold(
      (failure) =>
          emit(PromoSliderFaulure(message: _mapFailureToMessage(failure))),
      (listPromoSlideEntity) {
        emit(PromoSliderLoaded(listPromoSlideEntity: listPromoSlideEntity));
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.type) {
      case FailureType.serverError:
        return SERVER_FAILURE;
      case FailureType.cacheError:
        return CACHE_FAILURE;
    }
  }
}
