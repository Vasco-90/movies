import 'package:flutter/material.dart';
import 'package:movies/favorites/cubit/favorite_cubit.dart';
import 'package:movies/movies/model/movie.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCard extends StatelessWidget {
  MovieCard({
    Key? key,
    required this.movie,
    required this.isFavorite,
  }) : super(key: key);

  final Movie movie;
  final DateFormat _formatter = DateFormat('dd.MM.yyyy');
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${movie.poster ?? movie.thumbnail}',
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null
                          ? child
                          : Center(
                              child: const CircularProgressIndicator.adaptive(),
                            ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 18.0),
                child: Text(
                  movie.title,
                  maxLines: 2,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (movie.releaseDate != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                  child: Text(
                    formatReleaseDate(movie.releaseDate!),
                    maxLines: 2,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.grey.withOpacity(0.6),
                    ),
                  ),
                ),
            ],
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: GestureDetector(
            onTap: () => context.read<FavoriteCubit>().toggleFavorite(movie),
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }

  String formatReleaseDate(String date) {
    try {
      return _formatter.format(DateTime.parse(date));
    } catch (e) {
      return date;
    }
  }
}
