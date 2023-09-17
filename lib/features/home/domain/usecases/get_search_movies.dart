import 'package:screens_movie_stream/core/resources/data_state.dart';
import 'package:screens_movie_stream/core/usecase/use_case.dart';
import 'package:screens_movie_stream/features/home/domain/entities/movie.dart';
import 'package:screens_movie_stream/features/home/domain/repository/movie_repository.dart';

class GetSearchMoviesUseCase
    implements UseCase<DataState<List<MovieEntity>>, String?> {
  final MovieRepository _movieRepository;

  GetSearchMoviesUseCase(this._movieRepository);

  @override
  Future<DataState<List<MovieEntity>>> call({String? params}) {

    return _movieRepository.getSearchMovies(params!);
  }
}
