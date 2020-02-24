import 'package:flutter/material.dart';
import 'package:movie_night/constants.dart';
import 'package:movie_night/views/movie_list_page.dart';

class InputPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        controller: _controller,
        decoration: kInputFieldStyle,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            Navigator.push(context,
              MaterialPageRoute(
                builder: (context) {
                  return MovieListPage();
                }
              )
            );
          }
        },
      ),
    );
  }
}
