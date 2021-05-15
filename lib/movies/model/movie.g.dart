// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    id: json['id'] as int,
    thumbnail: json['backdropPath'] as String,
    title: json['title'] as String,
    releaseDate: json['release_date'] as String,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'backdropPath': instance.thumbnail,
      'title': instance.title,
      'release_date': instance.releaseDate,
    };
