import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/core/util/pretty_price.dart';

import '../../../../config/theme/app_theme.dart';
import '../../data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({
    super.key,
    required this.product,
  });

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
            Stack(
              alignment: Alignment.topRight,
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
                if (product.oldPrice != null || product.promotions != null)
                  promoIcons(),
              ],
            ),
            const SizedBox(height: 8),
            Text(product.category, style: AppStyles.productCardCategory),
            const SizedBox(height: 4),
            Text(product.lable,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.productCardLable),
            const SizedBox(height: 8),
            price()
          ],
        ),
      ),
    );
  }

  Widget promoIcons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          product.oldPrice != null
              ? SvgPicture.asset('assets/svg/percent.svg')
              : const SizedBox.shrink(),
          const SizedBox(height: 8),
          product.promotions != null
              ? SvgPicture.asset('assets/svg/1+1.svg')
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget price() {
    return Row(
      children: [
        Text('${PrettyPrice.formatPrice(product.price)} ₽',
            style: AppStyles.productCardPrice),
        const SizedBox(width: 8),
        if (product.oldPrice != null)
          Text('${PrettyPrice.formatPrice(product.oldPrice!)} ₽',
              style: AppStyles.productCardOldPrice),
      ],
    );
  }
}
