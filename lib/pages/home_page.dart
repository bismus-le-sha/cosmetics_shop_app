import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shop/db.dart';
import 'package:shop/features/category_carousel/presentation/widgets/category_card_carousel.dart';
import 'package:shop/widgets/home_category_buttons.dart';
import 'package:shop/widgets/scrollable_section.dart';
import 'package:shop/widgets/take_test_widget.dart';

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
            height: screenHeight * 0.4,
            child: const PromoSlider(),
          ),
          CategoryCardCarousel(
              categoryCards: TestCategoryCardList.categoryCardModelList),
          ScrollableSection(
            title: 'Новинки',
            products: [
              TestProduct.productModel,
              TestProduct.productModel,
              TestProduct.productModel
            ],
          ),
          const HTTWidget(),
          ScrollableSection(
            title: 'Акции',
            colors: const [Colors.white, Colors.pink],
            products: [
              TestProduct.promoProductModel1,
              TestProduct.promoProductModel2,
              TestProduct.promoProductModel1
            ],
          ),
          HomeCategoryButtons(),
          ScrollableSection(
            title: 'Хиты',
            colors: const [Colors.orange, Colors.white],
            products: [
              TestProduct.productModel,
              TestProduct.productModel,
              TestProduct.productModel
            ],
          ),
        ],
      ),
    );
  }
}
