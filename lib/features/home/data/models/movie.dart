import 'package:intl/intl.dart';
import 'package:screens_movie_stream/features/home/domain/entities/movie.dart';

class MovieModel extends MovieEntity {
  const MovieModel(
      {int? id,
      String? title,
      String? description,
      DateTime? date,
      double? popularity,
      double? vote,
      int? voteCount,
      String? posterImage,
      String? wallpaperImage})
      : super(
            id: id,
            title: title,
            description: description,
            date: date,
            popularity: popularity,
            vote: vote,
            voteCount: voteCount,
            posterImage: posterImage,
            wallpaperImage: wallpaperImage);

  factory MovieModel.fromJson(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: map['date'] != "" && map['date'] != null
          ? DateFormat("yyyy-MM-dd").parse(map['date'])
          : null,
      popularity: map['popularity'],
      vote: double.tryParse(map['vote']?.toString() ?? ""),
      voteCount: map['voteCount'],
      wallpaperImage: "https://image.tmdb.org/t/p/w500${map['wallpaperImage']}",
      posterImage: "https://image.tmdb.org/t/p/w500${map['posterImage']}",
    );
  }

  factory MovieModel.fromEntity(MovieEntity entity) {
    return MovieModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      date: entity.date,
      popularity: entity.popularity,
      vote: entity.vote,
      voteCount: entity.voteCount,
      wallpaperImage: entity.wallpaperImage,
      posterImage: entity.posterImage,
    );
  }
}

class MovieResponse {
  final List<MovieModel> movies;

  MovieResponse(this.movies);

  factory MovieResponse.fromJson(Map json) {
    List data = json['data'];
    return MovieResponse(data.map((e) => MovieModel.fromJson(e)).toList());
  }
}
