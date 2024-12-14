import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shop/core/error/exceptions.dart';
import 'package:shop/core/resources/db_config.dart';
import 'package:shop/features/promo_slider/data/datasources/local_promo_slide_data_source.dart';
import 'package:shop/features/promo_slider/data/models/promo_slide_models.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockSharedPreferences preferences;
  late LocalPromoSlideDataSourceImpl dataSource;
  late List<PromoSlideModel> testPromoSlideList;

  setUp(() {
    preferences = MockSharedPreferences();
    dataSource = LocalPromoSlideDataSourceImpl(
      sharedPreferences: preferences,
    );
    testPromoSlideList = (json.decode(fixture('promo_slider.json'))
            as List<dynamic>)
        .map((json) => PromoSlideModel.fromJson(json as Map<String, dynamic>))
        .toList();
  });

  group('getLastPromoSlides', () {
    test(
      'should return PromoSlide list from SharedPreferences when there is one in the cache',
      () async {
        // arrange
        when(preferences.getString(any))
            .thenReturn(fixture('promo_slider.json'));
        // act
        final result = await dataSource.getLastPromoSlides();
        // assert
        verify(preferences.getString(CACHE_PROMO_SLIDES));
        expect(result, equals(testPromoSlideList));
      },
    );

    test(
      'should throw a CacheExeption when there is not a cached value',
      () async {
        // arrange
        when(preferences.getString(any)).thenReturn(null);
        // act
        call() => dataSource.getLastPromoSlides();
        // assert
        expect(call, throwsA(const TypeMatcher<CacheException>()));
      },
    );
  });

  group('cachePromoSlides', () {
    test(
      'should call SharedPreferences to cache the data',
      () async {
        // arrange
        when(preferences.setString(any, any)).thenAnswer((_) async => true);
        // act
        dataSource.cachePromoSlides(testPromoSlideList);
        // assert
        final expectedJsonString = json
            .encode(testPromoSlideList.map((slide) => slide.toJson()).toList());
        verify(preferences.setString(
          CACHE_PROMO_SLIDES,
          expectedJsonString,
        ));
      },
    );
  });
}
