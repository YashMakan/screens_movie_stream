import 'package:screens_movie_stream/core/resources/data_state.dart';
import 'package:screens_movie_stream/core/usecase/use_case.dart';
import 'package:screens_movie_stream/features/detail/domain/entities/movie_detail.dart';
import 'package:screens_movie_stream/features/detail/domain/repository/detail_repository.dart';

class DownloadMovieUseCase
    implements UseCase<DataState<String>, String?> {
  final DetailRepository _detailRepository;

  DownloadMovieUseCase(this._detailRepository);

  @override
  Future<DataState<String>> call({String? params}) {

    return _detailRepository.downloadMovie(params!);
  }
}
