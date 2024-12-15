import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:shop/core/error/exceptions.dart';
import 'package:shop/core/error/failures.dart';
import 'package:shop/features/promo_slider/data/models/promo_slide_models.dart';
import 'package:shop/features/promo_slider/data/repositories/promo_slide_repository_impl.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late PromoSlideRepositoryImpl repository;
  late MockRemotePromoSlideDataSource mockRemoteDataSource;
  late MockLocalPromoSlideDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemotePromoSlideDataSource();
    mockLocalDataSource = MockLocalPromoSlideDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = PromoSlideRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  final testPromoSlideList =
      (json.decode(fixture('promo_slider.json')) as List<dynamic>)
          .map((json) => PromoSlideModel.fromJson(json as Map<String, dynamic>))
          .toList();

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getPromoSlides', () {
    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.getPromoSlides())
            .thenAnswer((_) async => testPromoSlideList);
        // act
        repository.getPromoSlides();
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getPromoSlides())
              .thenAnswer((_) async => testPromoSlideList);
          // act
          final result = await repository.getPromoSlides();
          // assert
          verify(mockRemoteDataSource.getPromoSlides());
          expect(result, equals(Right(testPromoSlideList)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getPromoSlides())
              .thenAnswer((_) async => testPromoSlideList);
          // act
          await repository.getPromoSlides();
          // assert
          verify(mockRemoteDataSource.getPromoSlides());
          verify(mockLocalDataSource.cachePromoSlides(testPromoSlideList));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getPromoSlides())
              .thenThrow(ServerException());
          // act
          final result = await repository.getPromoSlides();
          // assert
          verify(mockRemoteDataSource.getPromoSlides());
          expect(
              result, equals(Left(Failure.fromType(FailureType.serverError))));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return locally cached data when the cached data is present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastPromoSlides())
              .thenAnswer((_) async => testPromoSlideList);
          // act
          final result = await repository.getPromoSlides();
          // assert
          verify(mockLocalDataSource.getLastPromoSlides());
          expect(result, equals(Right(testPromoSlideList)));
        },
      );

      test(
        'should return cache failure when there is no cached data',
        () async {
          // arrange
          when(mockLocalDataSource.getLastPromoSlides())
              .thenThrow(CacheException());
          // act
          final result = await repository.getPromoSlides();
          // assert
          verify(mockLocalDataSource.getLastPromoSlides());
          expect(
              result, equals(Left(Failure.fromType(FailureType.cacheError))));
        },
      );
    });
  });
}
