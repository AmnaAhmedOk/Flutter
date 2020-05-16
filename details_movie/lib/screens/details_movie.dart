import 'dart:ui';

import 'package:detailsmovie/screens/star_icon.dart';
import 'package:flutter/material.dart';



class MovieDetails extends StatelessWidget{
  final movie;
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  var pressedIcon=false;

  MovieDetails(this.movie);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: new SingleChildScrollView(

          child: new Container(
            margin: const EdgeInsets.all(10.0),

            child: new Column(
            children: <Widget>[

         new Container(
          margin: const EdgeInsets.all(5.0),

          width: 500.0,
          height: 400.0,

          child: Hero(
            tag: movie,
            child: Image.network(image_url+movie.posterPath, fit: BoxFit.fill),),

        ),
              new Container(
                  margin: const EdgeInsets.all(20.0),
                  alignment: Alignment.topLeft,
                 child: Text(movie.title,
                   style: TextStyle(
                     fontSize: 25,
                       fontWeight: FontWeight.bold

                   ),

                 )
              ),
          new Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.all(10.0),

            child:  Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(10, (index) {
                  return Icon(
                    index <  movie.voteAverage? Icons.star : Icons.star_border,

                  );
                }),
              ),
//          _bigger = !_bigger;
       ),
          new Container(
             /*child : AnimatedContainer(

             ), duration: Duration(seconds: 1),*/
            alignment: Alignment.topLeft,
            child:new Row(

              children: <Widget>[
                RateIcon(),

                new Text('${movie.voteAverage}/10',
                  style: new TextStyle(color: Colors.white,fontSize: 20.0,fontFamily: 'Arvo'),)
              ],
            ),

             ),



           new Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.all(10.0),

            child: new Text("OverView",style: new TextStyle(color: Colors.white,fontFamily: 'Arvo'
                ,fontWeight: FontWeight.bold, fontSize: 20)),
          ),

              new Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(13.0),

               child: new Text(movie.overview,style: new TextStyle(color: Colors.white,fontSize: 18)),

              ),

            ]
        ),

    ),
      ),
      ),

    );

  }

}

