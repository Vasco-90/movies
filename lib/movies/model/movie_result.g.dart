// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResult _$MovieResultFromJson(Map<String, dynamic> json) {
  return MovieResult(
    page: json['page'] as int,
    results: (json['results'] as List<dynamic>)
        .map((e) => Movie.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalPages: json['totalPages'] as int,
    totalResults: json['totalResults'] as int,
  );
}

Map<String, dynamic> _$MovieResultToJson(MovieResult instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };
