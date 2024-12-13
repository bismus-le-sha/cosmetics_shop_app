part of 'promo_slider_bloc.dart';

abstract class PromoSliderState extends Equatable {
  const PromoSliderState();

  @override
  List<Object> get props => [];
}

class PromoSliderInitial extends PromoSliderState {}

class PromoSliderLoading extends PromoSliderState {}

class PromoSliderLoaded extends PromoSliderState {
  final List<PromoSlideEntity> listPromoSlideEntity;

  const PromoSliderLoaded({required this.listPromoSlideEntity});

  @override
  List<Object> get props => [listPromoSlideEntity];
}

class PromoSliderFaulure extends PromoSliderState {
  final String message;

  const PromoSliderFaulure({required this.message});

  @override
  List<Object> get props => [message];
}
