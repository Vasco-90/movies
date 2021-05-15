part of 'movie_cubit.dart';

@freezed
abstract class MovieState with _$MovieState {
  const factory MovieState.initial() = _Initial;
}
