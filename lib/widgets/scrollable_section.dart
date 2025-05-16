import 'package:flutter/material.dart';
import 'package:shop/features/product/data/models/product_model.dart';

import '../features/product/presentation/widgets/section_widgets.dart';

class ScrollableSection extends StatelessWidget {
  final List<ProductModel> products;
  final String title;
  final List<Color> colors;
  const ScrollableSection({
    super.key,
    required this.title,
    this.colors = const [Colors.white, Colors.lightBlue],
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: title),
          SectionDivider(colors: colors),
          const SizedBox(height: 16),
          HorizontalItemList(
            products: products,
          ),
        ],
      ),
    );
  }
}
