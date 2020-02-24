import 'package:flutter/material.dart';
import 'package:movie_night/views/input_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Movie Night'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: InputPage(),
    );
  }
}

//import 'package:movie_night/view_models/movie_list_view_model.dart';
//import 'package:provider/provider.dart';
//ChangeNotifierProvider(
//  create: (context) => InputPage(),
//  child: InputPage(),
//),