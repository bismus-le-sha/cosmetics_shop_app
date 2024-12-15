import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:shop/core/error/exceptions.dart';
import 'package:shop/features/promo_slider/data/datasources/remote_promo_slide_data_source.dart';
import 'package:shop/features/promo_slider/data/models/promo_slide_models.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockClient mockClient;
  late RemotePromoSlideDataSourceImpl dataSource;

  setUp(() {
    mockClient = MockClient();
    dataSource = RemotePromoSlideDataSourceImpl(client: mockClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('promo_slider.json'), 200, headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            }));
  }

  void setUpMockHttpClientFailure404() {
    when(mockClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group('getPromoSlides', () {
    const tUrlPath = '/0';
    const tBaseUrl = '10.0.2.2:3000';
    final Uri tUri = Uri.http(tBaseUrl, tUrlPath);

    test(
      'should perform a GET request on a URL with application/json header',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        await dataSource.getPromoSlides();
        // assert
        verify(mockClient.get(
          tUri,
          headers: {'Content-Type': 'application/json'},
        ));
      },
    );

    test(
      'should return a List<PromoSlideModel> when the response code is 200',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        final tPromoSlideList =
            (json.decode(fixture('promo_slider.json')) as List<dynamic>)
                .map((json) =>
                    PromoSlideModel.fromJson(json as Map<String, dynamic>))
                .toList();
        // act
        final result = await dataSource.getPromoSlides();
        // assert
        expect(result, equals(tPromoSlideList));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getPromoSlides;
        // assert
        expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });
}
