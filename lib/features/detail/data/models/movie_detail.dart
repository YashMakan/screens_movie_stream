import 'package:screens_movie_stream/features/detail/domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetailEntity {
  const MovieDetailModel({int? id, String? link}) : super(id: id, link: link);

  factory MovieDetailModel.fromJson(Map<String, dynamic> map) {
    return MovieDetailModel(
      id: map['id'],
      link: map['link'],
    );
  }

  factory MovieDetailModel.fromEntity(MovieDetailEntity entity) {
    return MovieDetailModel(
      id: entity.id,
      link: entity.link
    );
  }
}
