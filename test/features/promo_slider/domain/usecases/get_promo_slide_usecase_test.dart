import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shop/core/usecase/usecase.dart';
import 'package:shop/features/promo_slider/data/models/promo_slide_models.dart';
import 'package:shop/features/promo_slider/domain/usecases/get_promo_slide_usecase.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late GetPromoSlides usecase;
  late MockPromoSlideRepository repository;

  setUp(() => {
        repository = MockPromoSlideRepository(),
        usecase = GetPromoSlides(repository)
      });

  final testPromoSlideList =
      (json.decode(fixture('promo_slider.json')) as List<dynamic>)
          .map((json) => PromoSlideModel.fromJson(json as Map<String, dynamic>))
          .toList();

  test('should get promo-slides from the repository', () async {
    //arrange
    when(repository.getPromoSlides())
        .thenAnswer((_) async => Right(testPromoSlideList));
    //act
    final result = await usecase.call(NoParams());
    //assert
    expect(result, Right(testPromoSlideList));
  });
}
