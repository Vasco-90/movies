import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/movies/components/movie_card.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        home: TheMovieApp(),
      ),
    ),
  );
}

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
