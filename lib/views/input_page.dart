import 'package:flutter/material.dart';
import 'package:movie_night/constants.dart';
import 'package:movie_night/views/movie_list_page.dart';
import 'package:movie_night/view_models/movie_list_view_model.dart';
import 'package:provider/provider.dart';

class InputPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Center(
        child: TextField(
          controller: _controller,
          decoration: kInputFieldStyle,
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChangeNotifierProvider(
                  create: (context) => MovieListViewModel(),
                  child: MovieListPage(searchValue: value),
                );
              }));
            }
          },
        ),
      ),
    );
  }
}
