part of 'favorite_cubit.dart';

@freezed
abstract class FavoriteState with _$FavoriteState {
  const factory FavoriteState.loading() = _Loading;
  const factory FavoriteState.loaded() = _Loaded;
  const factory FavoriteState.error() = _Error;
}
