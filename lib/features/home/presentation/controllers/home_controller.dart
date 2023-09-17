import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screens_movie_stream/core/resources/data_state.dart';
import 'package:screens_movie_stream/features/home/domain/entities/movie.dart';
import 'package:screens_movie_stream/features/home/domain/usecases/get_discovery_movies.dart';
import 'package:screens_movie_stream/features/home/domain/usecases/get_popular_movies.dart';
import 'package:screens_movie_stream/features/home/domain/usecases/get_search_movies.dart';

class HomeController extends GetxController {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetDiscoveryMoviesUseCase getDiscoveryMoviesUseCase;
  final GetSearchMoviesUseCase getSearchMoviesUseCase;

  RxList<MovieEntity> popularMovies = <MovieEntity>[].obs;
  RxList<MovieEntity> discoverMovies = <MovieEntity>[].obs;
  RxList<MovieEntity> searchMovies = <MovieEntity>[].obs;

  RxBool isSearch = false.obs;
  final TextEditingController searchController = TextEditingController();
  RxString search = "".obs;

  HomeController(this.getPopularMoviesUseCase, this.getDiscoveryMoviesUseCase,
      this.getSearchMoviesUseCase);

  Future<void> getPopularMovies() async {
    final dataState = await getPopularMoviesUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      popularMovies.value = dataState.data!;
    } else if (dataState is DataFailed) {
      print("ERROR ${dataState.error}");
    }
  }

  Future<void> getDiscoveryMovies() async {
    final dataState = await getDiscoveryMoviesUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      discoverMovies.value = dataState.data!;
    } else if (dataState is DataFailed) {
      print("ERROR ${dataState.error}");
    }
  }

  void toggleSearch() {
    isSearch.value = !isSearch.value;
    if(isSearch.isFalse) {
      searchMovies.clear();
      searchController.clear();
    }
  }

  void onSearchChanged(String value) {
    search.value = value;
  }

  Future<void> onSearchClicked() async {
    final dataState = await getSearchMoviesUseCase(params: search.value);
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      searchMovies.value = dataState.data!;
    } else if (dataState is DataFailed) {
      print("ERROR ${dataState.error}");
    }
  }
}
