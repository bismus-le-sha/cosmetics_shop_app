import 'package:flutter/material.dart';
import 'package:shop/features/product/data/models/product_model.dart';
import 'package:shop/features/product/presentation/widgets/product_card.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SectionDivider extends StatelessWidget {
  final List<Color> colors;
  const SectionDivider({
    super.key,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: SizedBox(
        height: 3,
        width: 100,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: colors,
            ),
          ),
        ),
      ),
    );
  }
}

class HorizontalItemList extends StatelessWidget {
  final List<ProductModel> products;
  const HorizontalItemList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
          );
        },
      ),
    );
  }
}
