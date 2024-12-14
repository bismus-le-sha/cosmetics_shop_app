import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shop/features/promo_slider/data/models/promo_slide_models.dart';
import 'package:shop/features/promo_slider/domain/entities/promo_slide_entity.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const testPromoModel = PromoSlideModel(
      imageUrl:
          "https://i.pinimg.com/736x/5b/dc/f9/5bdcf99efff14588d2f5604073652665.jpg",
      discount: "-15%",
      title: "Сыворотка",
      description: "HA EYE & NECK SERUM",
      buttonText: "Перейти к акции");

  test(
    'should be a subclass of PromoSlideEntity',
    () async {
      //assert
      expect(testPromoModel, isA<PromoSlideEntity>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model from JSON',
      () async {
        // arrange
        final List<dynamic> jsonList =
            json.decode(fixture('promo_slider.json'));
        final Map<String, dynamic> jsonMap = jsonList.first;
        // act
        final result = PromoSlideModel.fromJson(jsonMap);
        // assert
        expect(result, testPromoModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = testPromoModel.toJson();
        // assert
        final expectedMap = {
          "imageUrl":
              "https://i.pinimg.com/736x/5b/dc/f9/5bdcf99efff14588d2f5604073652665.jpg",
          "discount": "-15%",
          "title": "Сыворотка",
          "description": "HA EYE & NECK SERUM",
          "buttonText": "Перейти к акции"
        };
        expect(result, expectedMap);
      },
    );
  });
}
