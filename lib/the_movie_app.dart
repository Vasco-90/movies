import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movies/movies/components/movie_card.dart';
import 'package:movies/movies/cubit/movie_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/model/movie_result.dart';

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

class MovieList extends StatelessWidget {
  const MovieList({
    Key? key,
    required this.result,
  }) : super(key: key);

  final MovieResult result;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2 / 4),
      itemCount: result.results.length,
      itemBuilder: (context, index) => MovieCard(
        movie: result.results[index],
      ),
    );
  }
}
