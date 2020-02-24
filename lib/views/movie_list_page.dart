import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_night/view_models/movie_list_view_model.dart';
import 'package:movie_night/widgets/movie_list.dart';

class MovieListPage extends StatefulWidget {
  final String searchValue;

  MovieListPage({this.searchValue});

  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<MovieListViewModel>(context, listen: false)
        .fetchFirstPage(widget.searchValue);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MovieListViewModel>(context);
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Text('Seach: ${widget.searchValue}'),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: MovieList(vm),
          ),
        ],
      ),
    );
  }
}
