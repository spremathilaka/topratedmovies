import 'package:flutter/material.dart';
import './movie_list.dart';


//https://blog.usejournal.com/flutter-hands-on-building-a-movie-listing-app-using-flutter-part-1-c2b22d9be6b8
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movie List Demo',
      home: MovieList(),
    );
  }
}

