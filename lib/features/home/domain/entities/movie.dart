import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final DateTime? date;
  final double? popularity;
  final double? vote;
  final int? voteCount;
  final String? posterImage;
  final String? wallpaperImage;

  const MovieEntity(
      {this.id,
      this.title,
      this.description,
      this.date,
      this.popularity,
      this.vote,
      this.voteCount,
      this.posterImage,
      this.wallpaperImage});

  @override
  List<Object?> get props {
    return [id, title, description, date, popularity, vote, voteCount];
  }
}
