import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/features/promo_slider/data/datasources/local_promo_slide_data_source.dart';
import 'package:shop/features/promo_slider/data/datasources/remote_promo_slide_data_source.dart';
import 'package:shop/features/promo_slider/data/repositories/promo_slide_repository_impl.dart';
import 'package:shop/features/promo_slider/domain/usecases/get_promo_slide_usecase.dart';
import 'package:shop/features/promo_slider/presentation/bloc/promo_slider_bloc.dart';

import 'config/router/router.dart';
import 'core/util/network.dart';
import 'features/promo_slider/domain/repositories/promo_slide_repository.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Auth

  //Bloc
  sl.registerFactory(() => PromoSliderBloc(getPromoSlides: sl()));

  //Usecases
  sl.registerLazySingleton(() => GetPromoSlides(sl()));

  //Repository
  sl.registerLazySingleton<PromoSlideRepository>(() => PromoSlideRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  //Datasources
  sl.registerLazySingleton<RemotePromoSlideDataSource>(
      () => RemotePromoSlideDataSourceImpl(client: sl()));
  sl.registerLazySingleton<LocalPromoSlideDataSource>(
      () => LocalPromoSlideDataSourceImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<InternetConnection>(() => InternetConnection());

  //! Config

  //AppRouter
  sl.registerSingleton<AppRouter>(AppRouter());
}
