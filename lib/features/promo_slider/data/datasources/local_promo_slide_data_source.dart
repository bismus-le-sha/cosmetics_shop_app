import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/resources/db_config.dart';
import '../models/promo_slide_models.dart';

abstract class LocalPromoSlideDataSource {
  Future<void> cachePromoSlides(List<PromoSlideModel> slides);
  Future<List<PromoSlideModel>> getLastPromoSlides();
}

class LocalPromoSlideDataSourceImpl implements LocalPromoSlideDataSource {
  final SharedPreferences sharedPreferences;

  LocalPromoSlideDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cachePromoSlides(List<PromoSlideModel> slides) {
    List<Map<String, dynamic>> slidesJson =
        slides.map((slide) => slide.toJson()).toList();
    String slidesJsonString = jsonEncode(slidesJson);
    return sharedPreferences.setString(CACHE_PROMO_SLIDES, slidesJsonString);
  }

  @override
  Future<List<PromoSlideModel>> getLastPromoSlides() {
    final slidesJsonString = sharedPreferences.getString(CACHE_PROMO_SLIDES);
    if (slidesJsonString != null) {
      List<dynamic> slidesList = jsonDecode(slidesJsonString);
      List<PromoSlideModel> promoSlides =
          slidesList.map((json) => PromoSlideModel.fromJson(json)).toList();

      return Future.value(promoSlides);
    } else {
      throw CacheException();
    }
  }
}
