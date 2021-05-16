import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/movies/model/movie.dart';

part 'favorite_state.dart';
part 'favorite_cubit.freezed.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(_FavoriteState());

  void toggleFavorite(Movie movie) {
    if (state.movies.contains(movie)) {
      emit(
        state.copyWith(
          movies: List.from(state.movies)..remove(movie),
        ),
      );
    } else {
      emit(
        state.copyWith(
          movies: List.from(state.movies)..add(movie),
        ),
      );
    }
  }
}
