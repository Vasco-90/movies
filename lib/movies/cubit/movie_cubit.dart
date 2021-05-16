import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/movies/model/movie_result.dart';
import 'package:movies/movies/service/movie_service.dart';

part 'movie_state.dart';
part 'movie_cubit.freezed.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit({required this.movieService}) : super(MovieState.initial());

  final MovieService movieService;

  void loadPopularMovies() async {
    emit(_Initial());
    try {
      final popularMovies = await movieService.getPopularMovies();
      emit(
        _Loaded(result: popularMovies),
      );
    } catch (e) {
      print(e);
    }
  }
}
