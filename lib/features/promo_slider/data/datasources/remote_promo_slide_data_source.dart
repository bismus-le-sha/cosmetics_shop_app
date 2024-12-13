import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop/core/error/exceptions.dart';
import 'package:shop/features/promo_slider/data/models/promo_slide_models.dart';

abstract class RemotePromoSlideDataSource {
  Future<List<PromoSlideModel>> getPromoSlides();
}

class RemotePromoSlideDataSourceImpl implements RemotePromoSlideDataSource {
  final http.Client client;

  RemotePromoSlideDataSourceImpl({required this.client});

  @override
  Future<List<PromoSlideModel>> getPromoSlides() async {
    final response = await client.get(
      Uri.http('10.0.2.2:3000', '/0'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final decodedBody = utf8.decode(response.bodyBytes);
      final List<dynamic> jsonData = jsonDecode(decodedBody);
      return jsonData.map((json) => PromoSlideModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }
}
