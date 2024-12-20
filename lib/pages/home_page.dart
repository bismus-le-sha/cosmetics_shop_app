import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shop/widgets/scrollable_section.dart';

import '../features/promo_slider/presentation/pages/promo_slider.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: screenHeight * 0.4, // Слайдер занимает 40% экрана
            child: const PromoSlider(),
          ),
          // SizedBox(
          //     height: 300,
          //     child: Image(image: AssetImage('assets/images/promo_image.png'))),
          const ScrollableSection(
            title: 'Новинки',
          ),
        ],
      ),
    );
  }
}
