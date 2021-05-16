import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/cubit/movie_cubit.dart';
import 'package:movies/movies/movie_list.dart';

class TheMovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Movie App'),
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(
              Icons.favorite_rounded,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            loaded: (state) => MovieList(
              result: state.result,
            ),
          );
        },
      ),
    );
  }
}
