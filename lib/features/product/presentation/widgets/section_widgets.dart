import 'package:flutter/material.dart';
import 'package:shop/db.dart';
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
    this.colors = const [Colors.blue, Colors.green],
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
  const HorizontalItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ProductCard(
            product: TestProduct.productModel,
          );
        },
      ),
    );
  }
}
