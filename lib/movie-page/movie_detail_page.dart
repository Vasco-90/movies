import 'package:flutter/material.dart';
import 'package:movies/movies/model/movie.dart';
import 'package:sizer/sizer.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(movie.title),
            pinned: true,
            collapsedHeight: 20.h,
            primary: true,
            flexibleSpace: Hero(
              transitionOnUserGestures: true,
              tag: movie.id,
              child: Image.network(
                  'https://image.tmdb.org/t/p/original/${movie.poster ?? movie.thumbnail}',
                  fit: BoxFit.cover),
            ),
            expandedHeight: 40.h,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [Text(movie.title)],
            ),
          ),
        ],
      ),
    );
  }
}
