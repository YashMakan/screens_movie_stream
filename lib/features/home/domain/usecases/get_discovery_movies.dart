import 'package:screens_movie_stream/core/resources/data_state.dart';
import 'package:screens_movie_stream/core/usecase/use_case.dart';
import 'package:screens_movie_stream/features/home/domain/entities/movie.dart';
import 'package:screens_movie_stream/features/home/domain/repository/movie_repository.dart';

class GetDiscoveryMoviesUseCase
    implements UseCase<DataState<List<MovieEntity>>, void> {
  final MovieRepository _movieRepository;

  GetDiscoveryMoviesUseCase(this._movieRepository);

  @override
  Future<DataState<List<MovieEntity>>> call({void params}) {
    return _movieRepository.getDiscoverMovies();
  }
}
