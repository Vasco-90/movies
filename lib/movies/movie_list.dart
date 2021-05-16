import 'package:flutter/material.dart';
import 'package:movies/movies/components/movie_card.dart';
import 'package:movies/movies/model/movie_result.dart';

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
