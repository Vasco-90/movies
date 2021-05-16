import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  Movie({
    required this.id,
    required this.thumbnail,
    required this.title,
    required this.releaseDate,
    this.poster,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  final int id;

  @JsonKey(name: 'backdrop_path')
  final String thumbnail;

  @JsonKey(name: 'poster_path')
  final String? poster;

  final String title;

  @JsonKey(name: 'release_date')
  final String releaseDate;
}
