import 'package:flutter/material.dart';

void main() {
  runApp(TheMovieApp());
}

class TheMovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('The Movie App'),
        ),
      ),
    );
  }
}
