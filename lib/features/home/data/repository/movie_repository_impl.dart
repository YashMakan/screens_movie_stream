import 'dart:io';

import 'package:dio/dio.dart';
import 'package:screens_movie_stream/core/resources/data_state.dart';
import 'package:screens_movie_stream/features/home/data/data_sources/home_api_service.dart';
import 'package:screens_movie_stream/features/home/data/models/movie.dart';
import 'package:screens_movie_stream/features/home/domain/entities/movie.dart';
import 'package:screens_movie_stream/features/home/domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final HomeApiService _homeApiService;

  MovieRepositoryImpl(this._homeApiService);

  @override
  Future<DataState<List<MovieModel>>> getDiscoverMovies() async {
    try {
      final httpResponse = await _homeApiService.getDiscoverMovies();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.movies);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<MovieModel>>> getPopularMovies() async {
    try {
      final httpResponse = await _homeApiService.getPopularMovies();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.movies);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<MovieEntity>>> getSearchMovies(String query) async {
    try {
      final httpResponse = await _homeApiService.getSearchMovies({"q": query});

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.movies);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
