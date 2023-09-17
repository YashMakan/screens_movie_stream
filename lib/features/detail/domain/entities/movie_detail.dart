import 'package:equatable/equatable.dart';

class MovieDetailEntity extends Equatable {
  final int? id;
  final String? link;

  const MovieDetailEntity({this.id, this.link});

  @override
  List<Object?> get props {
    return [id, link];
  }
}
