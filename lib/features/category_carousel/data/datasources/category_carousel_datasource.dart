import 'package:shop/features/category_carousel/domain/entities/category_carousel_card_entity.dart';

abstract class CategoryCarouselDatasource {
  Future<List<CategoryCarouselCardEntity>> getCategoryCarousel();
}

class CategoryCarouselDataSourceImpl implements CategoryCarouselDatasource {
  @override
  Future<List<CategoryCarouselCardEntity>> getCategoryCarousel() async {
    // Simulate a network call or data fetching
    await Future.delayed(const Duration(seconds: 1));

    // Return a list of CategoryCarouselCardEntity objects
    return [
      CategoryCarouselCardEntity(
        lable: 'Category 1',
        imageUrl: 'https://example.com/image1.jpg',
      ),
      CategoryCarouselCardEntity(
        lable: 'Category 2',
        imageUrl: 'https://example.com/image2.jpg',
      ),
      CategoryCarouselCardEntity(
        lable: 'Category 3',
        imageUrl: 'https://example.com/image3.jpg',
      ),
    ];
  }
}
