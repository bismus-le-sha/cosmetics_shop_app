import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/promo_slider/domain/entities/promo_slide_entity.dart';
import 'package:shop/features/promo_slider/presentation/cubit/auto_slide_cubit_cubit.dart';
import 'package:shop/features/promo_slider/presentation/widgets/promo_slider_indicator.dart';
import 'package:shop/features/promo_slider/presentation/widgets/promo_slider_widget.dart';

class PromoSliderDisplay extends StatelessWidget {
  final List<PromoSlideEntity> promoSlides;
  final Duration autoScrollInterval;
  final bool isCyclic;
  const PromoSliderDisplay({
    super.key,
    required this.promoSlides,
    this.autoScrollInterval = const Duration(seconds: 5),
    this.isCyclic = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AutoSlideCubit(
        slideCount: promoSlides.length,
        interval: autoScrollInterval,
        isCyclic: isCyclic,
      ),
      child: PromoSliderView(promoSlides: promoSlides),
    );
  }
}

class PromoSliderView extends StatefulWidget {
  final List<PromoSlideEntity> promoSlides;
  const PromoSliderView({super.key, required this.promoSlides});

  @override
  State<PromoSliderView> createState() => _PromoSliderViewState();
}

class _PromoSliderViewState extends State<PromoSliderView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutoSlideCubit, int>(
      builder: (context, currentPage) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_pageController.hasClients &&
              _pageController.page?.round() != currentPage) {
            _pageController.animateToPage(
              currentPage,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        });

        return Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.promoSlides.length,
              onPageChanged: (index) =>
                  context.read<AutoSlideCubit>().manualPageChange(index),
              itemBuilder: (context, index) =>
                  PromoSlideWidget(slide: widget.promoSlides[index]),
            ),
            PromoSliderIndicator(
              slideCount: widget.promoSlides.length,
              currentPage: currentPage,
            ),
          ],
        );
      },
    );
  }
}
