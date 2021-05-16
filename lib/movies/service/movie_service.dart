import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movies/movies/model/movie_result.dart';

class MovieService {
  final String _apiKey = '62d1009aee447ddf70baddb84a5abdbb';
  final String _baseUrl = 'https://api.themoviedb.org/3/movie';

  Future<MovieResult> getPopularMovies([int page = 1]) async {
    final url = Uri.parse(
        '$_baseUrl/popular?api_key=$_apiKey&language=de-DE&page=$page');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return MovieResult.fromJson(
        jsonDecode(response.body),
      );
    }
    throw HttpException('Something went wrong, ${response.body}');
  }
}
