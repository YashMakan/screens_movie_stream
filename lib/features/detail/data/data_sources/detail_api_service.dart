import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:screens_movie_stream/core/constants/contants.dart';
import 'package:screens_movie_stream/features/detail/data/models/movie_detail.dart';

part 'detail_api_service.g.dart';

@RestApi(baseUrl: Strings.baseUrl)
abstract class DetailApiService {
  factory DetailApiService(Dio dio) = _DetailApiService;

  @POST('/details')
  Future<HttpResponse<MovieDetailModel>> getMovieDetails(
      @Body() Map<String, dynamic> detailsBody);

  @POST('/download')
  Future<HttpResponse> downloadMovie(
      @Body() Map<String, dynamic> downloadBody);
}
