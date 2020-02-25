import 'package:flutter/material.dart';
import 'package:movie_night/models/movie.dart';
import 'package:movie_night/view_models/movie_list_view_model.dart';

class MovieList extends StatefulWidget {
  final MovieListViewModel movieListViewModel;
  //final List<Movie> movies;
  //final int totalResults;

  MovieList(this.movieListViewModel);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    List<Movie> _movies = widget.movieListViewModel.movies;
    print('build MovieListState');
    return Scrollbar(
      child: ListView.builder(
          itemCount: _movies.length,
          itemBuilder: (context, i) {
            final Movie movie = _movies[i];
            if (!movie.loaded) {
              print('Movie #$i is not loaded');
              widget.movieListViewModel.fetchNextPage(i);
            }
            return _buildRow(movie);
          }),
    );
  }

  Widget _buildRow(Movie movie) {

    print('is row loaded: ${movie.loaded}');

    if(movie.loaded){
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
    } else {
      return Column(
        children: <Widget>[
          SizedBox(height: 100),
          Divider(),
        ],
      );
    }

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