import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/promo_slider/presentation/widgets/promo_slider_display.dart';
import 'package:shop/injection_container.dart';

import '../bloc/promo_slider_bloc.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = sl<PromoSliderBloc>();

    return BlocProvider(
      create: (_) {
        bloc.add(const PromoSliderLoad());
        return bloc;
      },
      child: BlocBuilder<PromoSliderBloc, PromoSliderState>(
        builder: (context, state) {
          if (state is PromoSliderLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PromoSliderLoaded) {
            return PromoSliderDisplay(promoSlids: state.listPromoSlideEntity);
          } else if (state is PromoSliderFailure) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
