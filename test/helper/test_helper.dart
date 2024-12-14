import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/core/util/network.dart';
import 'package:shop/features/promo_slider/data/datasources/local_promo_slide_data_source.dart';
import 'package:shop/features/promo_slider/data/datasources/remote_promo_slide_data_source.dart';
import 'package:shop/features/promo_slider/domain/repositories/promo_slide_repository.dart';
import 'package:shop/features/promo_slider/domain/usecases/get_promo_slide_usecase.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  //promo_slider
  PromoSlideRepository,
  RemotePromoSlideDataSource,
  LocalPromoSlideDataSource,
  SharedPreferences,
  NetworkInfo,
  GetPromoSlides,
  http.Client,
  //internet_connection_checker_plus
  InternetConnection,
])
void main() {}
