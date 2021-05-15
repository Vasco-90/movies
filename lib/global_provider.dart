import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/the_movie_app.dart';
import 'package:sizer/sizer.dart';

class GlobalProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        home: TheMovieApp(),
      ),
    );
  }
}
