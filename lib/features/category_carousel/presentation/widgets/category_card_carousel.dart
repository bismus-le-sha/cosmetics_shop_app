import 'package:flutter/material.dart';
import 'package:shop/features/category_carousel/data/models/category_carousel_card_model.dart';
import 'package:shop/features/category_carousel/presentation/widgets/category_card.dart';

class CategoryCardCarousel extends StatelessWidget {
  final List<CategoryCarouselCardModel> categoryCards;
  const CategoryCardCarousel({super.key, required this.categoryCards});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        itemCount: categoryCards.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryCard(
            category: categoryCards[index],
          );
        },
      ),
    );
  }
}
