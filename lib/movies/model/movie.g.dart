// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    id: json['id'] as int,
    thumbnail: json['backdrop_path'] as String,
    title: json['title'] as String,
    releaseDate: json['release_date'] as String,
    poster: json['poster_path'] as String?,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'backdrop_path': instance.thumbnail,
      'poster_path': instance.poster,
      'title': instance.title,
      'release_date': instance.releaseDate,
    };
