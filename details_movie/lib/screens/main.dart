
import 'package:flutter/material.dart';
import 'main_screen.dart';

void main(){

  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      color: Colors.white,
      theme: ThemeData.dark(),
      home: new MainMoviesProvider(),
    );
  }

}

