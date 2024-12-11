import 'package:flutter/material.dart';
import 'package:shop/core/util/pretty_price.dart';

import '../../../../config/theme/app_theme.dart';
import '../../data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppStyles.imagePlaceholderColor,
                  image: DecorationImage(
                    image: NetworkImage(product.imageUrl),
                  )),
            ),
            const SizedBox(height: 8),
            Text(product.category, style: AppStyles.productCardCategory),
            const SizedBox(height: 4),
            Text(product.lable,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.productCardLable),
            const SizedBox(height: 8),
            // Цена продукта
            Text('${PrettyPrice.formatPrice(product.price)} ₽',
                style: AppStyles.productCardPrice),
          ],
        ),
      ),
    );
  }
}
