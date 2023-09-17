import 'dart:io';

import 'package:dio/dio.dart';
import 'package:screens_movie_stream/core/resources/data_state.dart';
import 'package:screens_movie_stream/features/detail/data/data_sources/detail_api_service.dart';
import 'package:screens_movie_stream/features/detail/domain/entities/movie_detail.dart';
import 'package:screens_movie_stream/features/detail/domain/repository/detail_repository.dart';

class DetailRepositoryImpl extends DetailRepository {
  final DetailApiService _detailApiService;

  DetailRepositoryImpl(this._detailApiService);

  @override
  Future<DataState<MovieDetailEntity>> getMovieDetails(int movieId) async {
    try {
      final httpResponse = await _detailApiService.getMovieDetails({"id": movieId});

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
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
  Future<DataState<String>> downloadMovie(String movieUrl) async {
    try {
      final httpResponse = await _detailApiService.downloadMovie({"q": movieUrl});

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
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
