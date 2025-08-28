import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shop/config/router/router.dart';
import 'package:shop/db.dart';
import 'package:shop/features/product/data/models/product_model.dart';
import 'package:shop/features/product/presentation/widgets/product_card.dart';

class SubCatGridProductsDisplay extends StatelessWidget {
  final String appBarTitle;
  final List<ProductModel> productList;
  const SubCatGridProductsDisplay(
      {super.key, required this.appBarTitle, required this.productList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appBarTitle,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${productList.length} продуктов'),
                  IconButton(
                    icon: const Icon(Icons.sort),
                    onPressed: () {
                      context.pushRoute(const FiltersRoute());
                    },
                  ),
                ],
              ),
              _filteCarousel(TestFiltersList.filters),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                  ),
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    final product = productList[index];
                    return ProductCard(product: product);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _filteCarousel(List<String> filters) {
  return SizedBox(
    height: 60,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: filters.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: _buildFilterButton(filters[index]),
        );
      },
    ),
  );
}

Widget _buildFilterButton(String label) {
  return SizedBox(
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        elevation: 0,
      ),
      child: Text(label),
    ),
  );
}
