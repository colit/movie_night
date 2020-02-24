import 'package:movie_night/models/search_results.dart';
import 'package:movie_night/models/movie.dart';
import 'package:movie_night/webservice.dart';
import 'package:flutter/material.dart';

class MovieListViewModel extends ChangeNotifier {
  List<Movie> movies = List<Movie>();
  int totalResults;
  int _currentPage;
  String _keyword;

  Future<void> fetchFirstPage(String keyword) async {
    _keyword = keyword;
    _currentPage = 1;
    movies = [];
    await _fetchMovies();
  }

  Future<void> fetchNextPage() async {
    _currentPage ++;
    await _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    final SearchResults results = await Webservice().fetchMovies(_keyword, _currentPage);
    if (results.totalResults != null) {
      movies.addAll(results.movies);
      totalResults = results.totalResults;
      notifyListeners();
    }
  }
}