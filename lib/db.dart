import 'package:shop/features/category_carousel/data/models/category_carousel_card_model.dart';
import 'package:shop/features/product/data/models/product_model.dart';

class TestProduct {
  static ProductModel productModel = const ProductModel(
    category: 'Сыворотка',
    imageUrl:
        'https://s3-alpha-sig.figma.com/img/68a5/05a6/9a8d1eee5f72a8af73ac364f2cb17698?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=j8GX5GDTMh-6X6weN85pq0Pv-Dtw4NN~PYzf8ienSmnEdpB4a3SnDgI1KpGq3PVrRsBt6HaPDB2XJS5sjwQqFgaMUNLjn0CLNPhEO6N8w4VyouJBVoYbAnlY8q3PKPgcnehz9vOYro7HZM21jLLjRXow879irI-GrNj9b3tQ7RVWR73qjW8LrOleI4PxexUULKPQgxf6VQFP6X7dvXnssMtb7ynkzXCJV7oXxUPAR5uzV-Wqul8nTjkBp0De5SudOFVJKHT5J~LL7VleNC1D3qjo7dcY3R6QX643-NNynd~PYkxjadJ8LXXI6hFbibBWxXk8dnHO7oJkx6Cq981AqA__',
    lable: 'Unstress Total Serenity Serum',
    price: 10195,
  );

  static ProductModel promoProductModel1 = const ProductModel(
    category: 'Сыворотка',
    imageUrl:
        'https://s3-alpha-sig.figma.com/img/68a5/05a6/9a8d1eee5f72a8af73ac364f2cb17698?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=j8GX5GDTMh-6X6weN85pq0Pv-Dtw4NN~PYzf8ienSmnEdpB4a3SnDgI1KpGq3PVrRsBt6HaPDB2XJS5sjwQqFgaMUNLjn0CLNPhEO6N8w4VyouJBVoYbAnlY8q3PKPgcnehz9vOYro7HZM21jLLjRXow879irI-GrNj9b3tQ7RVWR73qjW8LrOleI4PxexUULKPQgxf6VQFP6X7dvXnssMtb7ynkzXCJV7oXxUPAR5uzV-Wqul8nTjkBp0De5SudOFVJKHT5J~LL7VleNC1D3qjo7dcY3R6QX643-NNynd~PYkxjadJ8LXXI6hFbibBWxXk8dnHO7oJkx6Cq981AqA__',
    lable: 'Unstress Total Serenity Serum',
    price: 5097,
    oldPrice: 10195,
  );
  static ProductModel promoProductModel2 = const ProductModel(
      category: 'Сыворотка',
      imageUrl:
          'https://s3-alpha-sig.figma.com/img/68a5/05a6/9a8d1eee5f72a8af73ac364f2cb17698?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=j8GX5GDTMh-6X6weN85pq0Pv-Dtw4NN~PYzf8ienSmnEdpB4a3SnDgI1KpGq3PVrRsBt6HaPDB2XJS5sjwQqFgaMUNLjn0CLNPhEO6N8w4VyouJBVoYbAnlY8q3PKPgcnehz9vOYro7HZM21jLLjRXow879irI-GrNj9b3tQ7RVWR73qjW8LrOleI4PxexUULKPQgxf6VQFP6X7dvXnssMtb7ynkzXCJV7oXxUPAR5uzV-Wqul8nTjkBp0De5SudOFVJKHT5J~LL7VleNC1D3qjo7dcY3R6QX643-NNynd~PYkxjadJ8LXXI6hFbibBWxXk8dnHO7oJkx6Cq981AqA__',
      lable: 'Unstress Total Serenity Serum',
      price: 5097,
      oldPrice: 10195,
      promotions: ['1+1']);
}

class TestCategoryCardList {
  static List<CategoryCarouselCardModel> categoryCardModelList = [
    CategoryCarouselCardModel(
        lable: 'Наборы', imageUrl: 'https://example.com/image1.jpg'),
    CategoryCarouselCardModel(
        lable: 'Для лица', imageUrl: 'https://example.com/image2.jpg'),
    CategoryCarouselCardModel(
        lable: 'Для глаз', imageUrl: 'https://example.com/image3.jpg'),
    CategoryCarouselCardModel(
        lable: 'Для тела', imageUrl: 'https://example.com/image4.jpg'),
    CategoryCarouselCardModel(
        lable: 'Для волос', imageUrl: 'https://example.com/image5.jpg'),
  ];
}
