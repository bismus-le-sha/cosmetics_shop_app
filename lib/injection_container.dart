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
import 'features/catalogue_list/data/datasources/catalogue_datasource.dart';
import 'features/catalogue_list/data/repositories/catalogue_repository_impl.dart';
import 'features/catalogue_list/domain/repositories/catalogue_repository.dart';
import 'features/catalogue_list/domain/usecases/get_catalogue_list.dart';
import 'features/catalogue_list/presentation/bloc/catalogue_list_bloc.dart';
import 'features/promo_slider/domain/repositories/promo_slide_repository.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Promo Slider

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

  //! Features - Catalogue List

  //Bloc
  sl.registerFactory(() => CatalogueListBloc(getCatalogueList: sl()));

  //Usecases
  sl.registerLazySingleton(() => GetCatalogueList(sl()));

  //Repository
  sl.registerLazySingleton<CatalogueRepository>(
      () => CatalogueRepositoryImpl(catalogueDatasource: sl()));

  //Datasources
  sl.registerLazySingleton<CatalogueDatasource>(
      () => CatalogueDatasourceImpl());

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
