import 'package:movie_night/models/movie.dart';

class MovieViewModel {
  final Movie movie;

  MovieViewModel({this.movie});

  String get title {
    return this.movie.loaded ? this.movie.title : null;
  }

  String get poster {
    return this.movie.loaded ? this.movie.poster : null;
  }

}