import 'package:flutter/material.dart';
import 'package:shop/features/promo_slider/data/models/promo_slide_models.dart';

import '../widgets/promo_slide_widget.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({super.key});

  @override
  _PromoSliderState createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<PromoSlideModels> slides = [
    const PromoSlideModels(
      imageUrl:
          "https://i.pinimg.com/736x/5b/dc/f9/5bdcf99efff14588d2f5604073652665.jpg",
      discount: '-15%',
      title: 'Сыворотка',
      description: 'HA EYE & NECK SERUM',
      buttonText: 'Перейти к акции',
    ),
    const PromoSlideModels(
      imageUrl:
          "https://i.pinimg.com/736x/ed/d9/16/edd916cc6573582a689834873587480f.jpg",
      discount: '-20%',
      title: 'Крем',
      description: 'HYDRA CREAM',
      buttonText: 'Подробнее',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildPageView(),
        _buildIndicators(),
      ],
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      controller: _pageController,
      itemCount: slides.length,
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
      itemBuilder: (context, index) {
        return PromoSlideWidget(slide: slides[index]);
      },
    );
  }

  Widget _buildIndicators() {
    return Positioned(
      top: 60,
      left: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          slides.length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _currentPage == index ? 12 : 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == index
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
