import 'package:movie_night/models/movie.dart';

class SearchResults {
  final int totalResults;
  final List<Movie> movies;

  SearchResults({this.totalResults, this.movies});

  factory SearchResults.fromJson(Map<String, dynamic> parsedJson) {
    if (parsedJson['Response'] == 'True') {
      var list = parsedJson['Search'] as List;
      List<Movie> moviesList = list.map((i) => Movie.fromJson(i)).toList();
      int _totalResults = int.tryParse(parsedJson['totalResults']);
      if (_totalResults == null) _totalResults = 0;
      return SearchResults(
        totalResults: _totalResults,
        movies: moviesList,
      );
    } else {
      return SearchResults(
        totalResults: null,
        movies: null,
      );
    }
  }
}