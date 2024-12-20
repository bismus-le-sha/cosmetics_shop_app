import 'package:flutter/material.dart';
import 'package:shop/features/promo_slider/domain/entities/promo_slide_entity.dart';

import 'promo_slider_widget.dart';

class PromoSliderDisplay extends StatefulWidget {
  final List<PromoSlideEntity> promoSlids;

  const PromoSliderDisplay({super.key, required this.promoSlids});

  @override
  State<PromoSliderDisplay> createState() => _PromoSliderDisplayState();
}

class _PromoSliderDisplayState extends State<PromoSliderDisplay> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildPageView(widget.promoSlids),
        _buildIndicators(widget.promoSlids.length),
      ],
    );
  }

  Widget _buildPageView(List<PromoSlideEntity> promoSlids) {
    return PageView.builder(
      controller: _pageController,
      itemCount: promoSlids.length,
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
      itemBuilder: (context, index) {
        return PromoSlideWidget(slide: promoSlids[index]);
      },
    );
  }

  Widget _buildIndicators(int listlength) {
    return Positioned(
      top: 60,
      left: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          listlength,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _currentPage == index ? 12 : 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == index
                  ? Colors.white
                  : Colors.white.withValues(alpha: 0.5),
            ),
          ),
        ),
      ),
    );
  }
}
