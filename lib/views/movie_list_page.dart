import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_night/view_models/movie_list_view_model.dart';
import 'package:movie_night/widgets/movie_list.dart';
import 'package:movie_night/constants.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    //Provider.of<MovieListViewModel>(context, listen: false)
    //    .fetchMovies("batman");
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MovieListViewModel>(context);
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: kInputFieldStyle,
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                vm.fetchMovies(value);
                _controller.clear();
              }
            },
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: MovieList(
              movies: vm.movies,
              totalResults: vm.totalResults,
            ),
          ),
        ],
      ),
    );
  }
}
