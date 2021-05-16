import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/favorites/cubit/favorite_cubit.dart';
import 'package:movies/movies/components/movie_list.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) => MovieList(
          scrollController: ScrollController(),
          movies: state.movies,
          canUpdateList: false,
        ),
      ),
    );
  }
}
