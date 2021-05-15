import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_state.dart';
part 'favorite_cubit.freezed.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteState.loading());

  void addFavorite() {}
  void deleteFavorite() {}
}
