import 'package:movie_night/models/search_results.dart';
import 'package:movie_night/models/movie.dart';
import 'package:movie_night/webservice.dart';
import 'package:flutter/material.dart';

class MovieListViewModel extends ChangeNotifier {
  List<Movie> movies = List<Movie>();
  int totalResults;
  String _keyword;

  Future<void> fetchFirstPage(String keyword) async {
    _keyword = keyword;
    movies = [];
    await _fetchMovies(1);
  }

  Future<void> fetchNextPage(int movieIndex) async {
    var _pageIndex = movieIndex ~/ 10 + 1;
    print('fetchNextPage: $_pageIndex');
    await _fetchMovies(_pageIndex);
  }

  Future<void> _fetchMovies(int page) async {
    final SearchResults results = await Webservice().fetchMovies(_keyword, page);
    if (results.totalResults == null) return;

    if (movies.length == 0) {
      print('init fill');
      totalResults = results.totalResults;
      for (var i = 0; i<totalResults; i++) {
        movies.add(Movie(loaded: false));
      }
      print('new length: ${movies.length}');
    }
    int _index = (page - 1) * 10;

    results.movies.forEach((movie) {
      movie.loaded = true;
      movies[_index] = movie;
      print('created($_index): ${movies[_index].title}');
      _index++;
    });

    notifyListeners();
  }
}