import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/movies/cubit/movie_cubit.dart';
import 'package:movies/movies/service/movie_service.dart';
import 'package:movies/the_movie_app.dart';
import 'package:sizer/sizer.dart';

class GlobalProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => MovieService(),
          )
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MovieCubit(),
            )
          ],
          child: MaterialApp(
            theme: ThemeData(
              brightness: Brightness.dark,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            home: TheMovieApp(),
          ),
        ),
      ),
    );
  }
}
