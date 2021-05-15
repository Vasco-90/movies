import 'package:flutter/material.dart';
import 'package:movies/movies/components/movie_card.dart';

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
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        shrinkWrap: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2 / 4),
        itemCount: 10,
        itemBuilder: (context, index) => MovieCard(),
      ),
    );
  }
}
