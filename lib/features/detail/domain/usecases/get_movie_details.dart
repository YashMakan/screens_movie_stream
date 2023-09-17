import 'package:screens_movie_stream/core/resources/data_state.dart';
import 'package:screens_movie_stream/core/usecase/use_case.dart';
import 'package:screens_movie_stream/features/detail/domain/entities/movie_detail.dart';
import 'package:screens_movie_stream/features/detail/domain/repository/detail_repository.dart';

class GetMovieDetailsUseCase
    implements UseCase<DataState<MovieDetailEntity>, int?> {
  final DetailRepository _detailRepository;

  GetMovieDetailsUseCase(this._detailRepository);

  @override
  Future<DataState<MovieDetailEntity>> call({int? params}) {

    return _detailRepository.getMovieDetails(params!);
  }
}
