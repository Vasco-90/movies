class MovieService {
  final String _apiKey = '62d1009aee447ddf70baddb84a5abdbb';
  final String _baseUrl = 'https://api.themoviedb.org/3/movie';

  void getPopularMovies() {
    final url =
        Uri.parse('$_baseUrl/popular?api_key=$_apiKey&language=de-DE&page=1');
  }
}
