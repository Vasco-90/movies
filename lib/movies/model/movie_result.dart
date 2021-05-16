import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/movies/model/movie.dart';

part 'movie_result.g.dart';

@JsonSerializable()
class MovieResult {
  MovieResult({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResult.fromJson(Map<String, dynamic> json) =>
      _$MovieResultFromJson(json);

  final int page;
  final List<Movie> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;
}
