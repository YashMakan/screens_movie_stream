import 'package:screens_movie_stream/core/resources/data_state.dart';
import 'package:screens_movie_stream/features/home/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<DataState<List<MovieEntity>>> getPopularMovies();

  Future<DataState<List<MovieEntity>>> getDiscoverMovies();

  Future<DataState<List<MovieEntity>>> getSearchMovies(String query);
}
