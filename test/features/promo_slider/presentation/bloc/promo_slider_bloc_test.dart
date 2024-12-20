import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shop/core/error/failures.dart';
import 'package:shop/core/resources/consts.dart';
import 'package:shop/core/usecase/usecase.dart';
import 'package:shop/features/promo_slider/domain/entities/promo_slide_entity.dart';
import 'package:shop/features/promo_slider/presentation/bloc/promo_slider_bloc.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late PromoSliderBloc promoSliderBloc;
  late MockGetPromoSlides mockGetPromoSlides;

  final testPromoSlideList =
      (json.decode(fixture('promo_slider.json')) as List<dynamic>)
          .map((json) => PromoSlideEntity(
                imageUrl: json['imageUrl'] as String,
                discount: json['discount'] as String,
                title: json['title'] as String,
                description: json['description'] as String,
                buttonText: json['buttonText'] as String,
              ))
          .toList();

  setUp(() {
    mockGetPromoSlides = MockGetPromoSlides();
    promoSliderBloc = PromoSliderBloc(getPromoSlides: mockGetPromoSlides);
  });

  tearDown(() {
    promoSliderBloc.close();
  });

  test('initial state is PromoSliderInitial', () {
    expect(promoSliderBloc.state, equals(PromoSliderInitial()));
  });

  group('GetPromoSlider', () {
    blocTest<PromoSliderBloc, PromoSliderState>(
      'should emit [PromoSliderLoading, PromoSliderLoaded] when data is loaded successfully',
      build: () => promoSliderBloc,
      setUp: () {
        when(mockGetPromoSlides.call(NoParams())).thenAnswer((_) async =>
            Right<Failure, List<PromoSlideEntity>>(testPromoSlideList));
      },
      act: (bloc) => bloc.add(const PromoSliderLoad()),
      expect: () => <PromoSliderState>[
        PromoSliderLoading(),
        PromoSliderLoaded(listPromoSlideEntity: testPromoSlideList),
      ],
      verify: (_) {
        verify(mockGetPromoSlides.call(NoParams())).called(1);
      },
    );

    blocTest<PromoSliderBloc, PromoSliderState>(
      'emits [PromoSliderLoading, PromoSliderFaulure] with SERVER_FAILURE message on server error',
      build: () {
        when(mockGetPromoSlides.call(NoParams())).thenAnswer(
            (_) async => Left(Failure.fromType(FailureType.serverError)));
        return promoSliderBloc;
      },
      act: (bloc) => bloc.add(const PromoSliderLoad()),
      expect: () => [
        PromoSliderLoading(),
        const PromoSliderFailure(message: SERVER_FAILURE),
      ],
      verify: (_) {
        verify(mockGetPromoSlides.call(NoParams())).called(1);
      },
    );

    blocTest<PromoSliderBloc, PromoSliderState>(
      'emits [PromoSliderLoading, PromoSliderFaulure] with CACHE_FAILURE message on cache error',
      build: () {
        when(mockGetPromoSlides.call(NoParams())).thenAnswer(
            (_) async => Left(Failure.fromType(FailureType.cacheError)));
        return promoSliderBloc;
      },
      act: (bloc) => bloc.add(const PromoSliderLoad()),
      expect: () => [
        PromoSliderLoading(),
        const PromoSliderFailure(message: CACHE_FAILURE),
      ],
      verify: (_) {
        verify(mockGetPromoSlides.call(NoParams())).called(1);
      },
    );
  });
}
