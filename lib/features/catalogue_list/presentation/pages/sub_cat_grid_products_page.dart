import 'package:auto_route/annotations.dart';
import 'package:flutter/widgets.dart';
import 'package:shop/features/catalogue_list/presentation/widgets/sub_cat_grid_products_display.dart';
import 'package:shop/features/product/data/models/product_model.dart';

@RoutePage()
class SubCatGridProductsPage extends StatelessWidget {
  final String appBarTitle;
  final List<ProductModel> productList;
  const SubCatGridProductsPage(
      {super.key, required this.appBarTitle, required this.productList});

  @override
  Widget build(BuildContext context) {
    return SubCatGridProductsDisplay(
      appBarTitle: appBarTitle,
      productList: productList,
    );
  }
}
