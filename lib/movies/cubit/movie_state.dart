part of 'movie_cubit.dart';

@freezed
abstract class MovieState with _$MovieState {
  const factory MovieState.initial() = _Initial;
  const factory MovieState.loaded({
    required MovieResult result,
    @Default(null) dynamic? error,
  }) = _Loaded;
}
