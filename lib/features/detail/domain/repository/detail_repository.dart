import 'package:screens_movie_stream/core/resources/data_state.dart';
import 'package:screens_movie_stream/features/detail/domain/entities/movie_detail.dart';

abstract class DetailRepository {
  Future<DataState<MovieDetailEntity>> getMovieDetails(int movieId);

  Future<DataState<String>> downloadMovie(String movieUrl);
}
