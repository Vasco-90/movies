import 'package:flutter/material.dart';
import 'package:movies/favorites/favorite_screen.dart';
import 'package:movies/movies/movie_screen.dart';

class TheMovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(
        title: Text('The Movie App'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FavoriteScreen(),
              ),
            ),
            icon: Icon(
              Icons.favorite_rounded,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: MovieScreen(),
    );
  }
}
