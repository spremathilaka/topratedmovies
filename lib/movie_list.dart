import 'package:flutter/material.dart';
import 'package:movie_app/movie_cell.dart';
import 'package:movie_app/movie_title.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class MovieList extends StatefulWidget {
   String API_KEY ="xxxxx";

  @override
  State createState() {
    return MovieListState();
  }
}

class MovieListState extends State<MovieList> {

  Color mainColor = const Color(0xff3C3261);
  var movies;

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.3,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back,
            color: mainColor,
          ),
          title: Text(
            'Movies',
            style: TextStyle(color: mainColor,
                fontFamily: 'Arvo',
                fontWeight: FontWeight.bold
            )
            ,
          ),
          actions: <Widget>[
            Icon(
              Icons.menu,
              color: mainColor,
            )
          ],
        ),

        body: Padding(padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MovieTitle(mainColor),
              Expanded(
                child: ListView.builder(
                  itemCount: movies == null ? 0 : movies.length,
                  itemBuilder: (context, i) {
                    return FlatButton(
                      child: MovieCell(movies, i),
                      padding: const EdgeInsets.all(0.0),
                      color: Colors.white,
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }

  void getData() async {
    var data = await getJson();
    setState(() {
      movies = data ['results'];
    });
  }

  Future<Map> getJson() async {
    var url = 'http://api.themoviedb.org/3/discover/movie?api_key='+widget.API_KEY;
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

}

