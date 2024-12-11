import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'promo_slider_event.dart';
part 'promo_slider_state.dart';

class PromoSliderBloc extends Bloc<PromoSliderEvent, PromoSliderState> {
  PromoSliderBloc() : super(PromoSliderInitial()) {
    on<PromoSliderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
