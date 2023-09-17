import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:screens_movie_stream/features/detail/domain/usecases/get_movie_details.dart';
import 'package:screens_movie_stream/features/detail/presentation/controllers/detail_controller.dart';
import 'package:screens_movie_stream/features/home/domain/usecases/get_popular_movies.dart';
import 'package:screens_movie_stream/features/home/presentation/controllers/home_controller.dart';

import 'features/detail/data/data_sources/detail_api_service.dart';
import 'features/detail/data/repository/detail_repository_impl.dart';
import 'features/detail/domain/repository/detail_repository.dart';
import 'features/detail/domain/usecases/download_movie.dart';
import 'features/home/data/data_sources/home_api_service.dart';
import 'features/home/data/repository/movie_repository_impl.dart';
import 'features/home/domain/repository/movie_repository.dart';
import 'features/home/domain/usecases/get_discovery_movies.dart';
import 'features/home/domain/usecases/get_search_movies.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<HomeApiService>(HomeApiService(sl()));
  sl.registerSingleton<DetailApiService>(DetailApiService(sl()));
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl(sl()));
  sl.registerSingleton<DetailRepository>(DetailRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetPopularMoviesUseCase>(GetPopularMoviesUseCase(sl()));
  sl.registerSingleton<GetDiscoveryMoviesUseCase>(
      GetDiscoveryMoviesUseCase(sl()));
  sl.registerSingleton<GetSearchMoviesUseCase>(GetSearchMoviesUseCase(sl()));
  sl.registerSingleton<GetMovieDetailsUseCase>(GetMovieDetailsUseCase(sl()));
  sl.registerSingleton<DownloadMovieUseCase>(DownloadMovieUseCase(sl()));

  //Controller
  sl.registerFactory<HomeController>(() => HomeController(sl(), sl(), sl()));
  sl.registerFactory<DetailController>(() => DetailController(sl(), sl()));
}
