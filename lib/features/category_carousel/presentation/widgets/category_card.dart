import 'package:flutter/material.dart';
import 'package:shop/config/theme/app_theme.dart';
import 'package:shop/features/category_carousel/data/models/category_carousel_card_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryCarouselCardModel category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppStyles.imagePlaceholderColor,
                  image: DecorationImage(
                    image: NetworkImage(category.imageUrl),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(category.lable,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.productCardLable),
            ),
          ],
        ),
      ),
    );
  }
}
