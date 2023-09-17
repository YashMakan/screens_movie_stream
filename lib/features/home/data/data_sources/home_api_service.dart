import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:screens_movie_stream/core/constants/contants.dart';
import 'package:screens_movie_stream/features/home/data/models/movie.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: Strings.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET('/popular-movies')
  Future<HttpResponse<MovieResponse>> getPopularMovies();

  @GET('/discover-movies')
  Future<HttpResponse<MovieResponse>> getDiscoverMovies();

  @POST('/search-movies')
  Future<HttpResponse<MovieResponse>> getSearchMovies(
      @Body() Map<String, dynamic> searchBody);
}
