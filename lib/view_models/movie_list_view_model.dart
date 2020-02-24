import 'package:movie_night/models/search_results.dart';
import 'package:movie_night/models/movie.dart';
import 'package:movie_night/webservice.dart';
import 'package:flutter/material.dart';

class MovieListViewModel extends ChangeNotifier {
  List<Movie> movies = List<Movie>();
  int totalResults;
  int _currentPage = 1;

  Future<void> fetchMovies(String keyword) async {
    final SearchResults results = await Webservice().fetchMovies(keyword, _currentPage);
    if (results.response) {
      movies.addAll(results.movies);
      totalResults = results.totalResults;
      _currentPage ++;
      //movies = results.map((item) => MovieViewModel(movie: item)).toList();
      notifyListeners();
    }
  }
}