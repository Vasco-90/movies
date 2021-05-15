import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  Movie(
      {required this.id,
      required this.thumbnail,
      required this.title,
      required this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  final int id;

  @JsonKey(name: 'backdropPath')
  final String thumbnail;

  final String title;

  @JsonKey(name: 'release_date')
  final String releaseDate;
}
