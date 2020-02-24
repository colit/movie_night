import 'dart:convert';

import 'package:movie_night/models/search_results.dart';
import 'package:http/http.dart' as http;

class Webservice {

  Future<SearchResults> fetchMovies(String keyword, int page) async {
    const openMoviesAPIKey = '96e00f60';

    final url = "http://www.omdbapi.com/?s=$keyword&page=$page&apikey=$openMoviesAPIKey";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return new SearchResults.fromJson(jsonResponse);
    } else {
      throw Exception('Unable to perform request!');
    }
  }
}