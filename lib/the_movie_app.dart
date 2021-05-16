import 'package:flutter/material.dart';
import 'package:movies/movies/movie_list.dart';

class TheMovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
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
      body: MovieList(),
    );
  }
}
