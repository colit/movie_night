import 'package:flutter/material.dart';
import 'package:movie_night/models/movie.dart';

class MovieList extends StatefulWidget {
  final List<Movie> movies;
  final int totalResults;

  MovieList({this.movies, this.totalResults});

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    List<Movie> _movies = widget.movies;
    return ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (context, i) {
          final Movie movie = _movies[i];
          print(i);
          if (i >= _movies.length - 1) {
            print('please load more!');
          }
          return _buildRow(movie);
        });
  }

  Widget _buildRow(Movie movie) {
    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration: _moviePoster(movie.poster),
            width: 50,
            height: 100,
          ),
          title: Container(
            child: Text(movie.title),
          ),
        ),
        Divider(),
      ],
    );
  }

  BoxDecoration _moviePoster(String poster) {
    return (poster == "N/A")
        ? BoxDecoration(
      color: Colors.grey,
    )
        : BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(poster),
      ),
    );
  }
}