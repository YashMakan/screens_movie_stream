import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';
import 'package:screens_movie_stream/core/constants/contants.dart';
import 'package:screens_movie_stream/core/resources/data_state.dart';
import 'package:screens_movie_stream/features/detail/domain/entities/movie_detail.dart';
import 'package:screens_movie_stream/features/detail/domain/usecases/download_movie.dart';
import 'package:screens_movie_stream/features/detail/domain/usecases/get_movie_details.dart';

class DetailController extends GetxController {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final DownloadMovieUseCase downloadMovieUseCase;
  Rxn<MovieDetailEntity?> movieDetailEntity = Rxn();
  RxBool isDownloadInitiated = false.obs;
  Rx<VlcPlayerController?> player = Rxn();

  DetailController(this.getMovieDetailsUseCase, this.downloadMovieUseCase);

  Future<void> getMovieDetails(movieId) async {
    final dataState = await getMovieDetailsUseCase(params: movieId);
    if (dataState is DataSuccess) {
      movieDetailEntity.value = dataState.data!;
      print(movieDetailEntity.value!.link);
    } else if (dataState is DataFailed) {
      print("ERROR ${dataState.error}");
    }
  }

  Future<void> downloadAndStream(movieId) async {
    if(movieDetailEntity.value != null){
      print(movieDetailEntity.value!.link);
      isDownloadInitiated.value = true;
      final dataState = await downloadMovieUseCase(params: movieDetailEntity.value!.link);
      if (dataState is DataSuccess) {
        initializePlayer();
      } else if (dataState is DataFailed) {
        print("ERROR ${dataState.error}");
      }
    } else {
      print("ERROR: Unable to download Movie");
    }
  }

  Future<void> initializePlayer() async {
    player.value = VlcPlayerController.network(
      '${Strings.baseUrl}/stream',
      autoPlay: true,
      autoInitialize: true
    );
  }
}
