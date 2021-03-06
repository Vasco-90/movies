import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/favorites/cubit/favorite_cubit.dart';
import 'package:movies/movie-page/movie_detail_page.dart';
import 'package:movies/movies/components/movie_card.dart';
import 'package:movies/movies/model/movie.dart';
import 'package:sizer/sizer.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    Key? key,
    this.scrollController,
    required this.movies,
    this.canUpdateList = true,
  }) : super(key: key);

  final ScrollController? scrollController;
  final List<Movie> movies;
  final bool canUpdateList;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      child: GridView.builder(
        controller: scrollController,
        padding: const EdgeInsets.all(8),
        shrinkWrap: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: SizerUtil.orientation == Orientation.portrait ? 2 : 4,
          childAspectRatio: 2 / 4,
        ),
        itemCount: canUpdateList ? movies.length + 1 : movies.length,
        itemBuilder: (context, index) => index >= movies.length
            ? Center(child: CircularProgressIndicator.adaptive())
            : Builder(
                builder: (context) {
                  final favoriteList =
                      context.watch<FavoriteCubit>().state.movies;
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailPage(
                            movie: movies[index],
                          ),
                        )),
                    child: MovieCard(
                      movie: movies[index],
                      isFavorite: favoriteList.contains(
                        movies[index],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
