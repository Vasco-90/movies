part of 'favorite_cubit.dart';

@freezed
abstract class FavoriteState with _$FavoriteState {
  const factory FavoriteState({@Default(<Movie>[]) List<Movie> movies}) =
      _FavoriteState;
}
