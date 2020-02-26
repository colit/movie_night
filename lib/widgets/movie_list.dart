import 'package:flutter/material.dart';
import 'package:movie_night/models/movie.dart';
import 'package:movie_night/view_models/movie_list_view_model.dart';

class MovieList extends StatelessWidget {
  final MovieListViewModel movieListViewModel;
  MovieList(this.movieListViewModel);

  @override
  Widget build(BuildContext context) {
    List<Movie> _movies = movieListViewModel.movies;
    return Scrollbar(
      child: ListView.builder(
          itemCount: _movies.length,
          itemBuilder: (context, i) {
            final Movie movie = _movies[i];
            if (!movie.loaded) {
              movieListViewModel.fetchNextPage(i);
            }
            return _buildRow(movie);
          }),
    );
  }

  Widget _buildRow(Movie movie) {
    if(movie.loaded){
      return Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: _moviePoster(movie.poster),
                  width: 68,
                  height: 100,
                ),
                SizedBox(width: 10),
                Flexible(child: Text(movie.title)),
              ],
            ),
          ),
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
      color: Colors.grey.shade700,
    )
        : BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(poster),
      ),
    );
  }
}