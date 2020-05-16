
import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget{

  final movie;
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieDetail(this.movie);
  Color mainColor = const Color(0xff3C3261);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
          fit: StackFit.expand,
          children: [


            new SingleChildScrollView(
              child: new Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(10.0),
                child: new Column(
                  children: <Widget>[

                    new Container(

                      alignment: Alignment.center,
                      child: new Container(width: 500.0,height: 400.0,),
                      decoration: new BoxDecoration(
                          image: new DecorationImage(image: new NetworkImage
                            (image_url + movie.posterPath),fit: BoxFit.fill),

                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 0.0),
                      child: new Row(

                        children: <Widget>[
                          new Expanded(child: new Text(movie.title,style:
                          new TextStyle(color: Colors.white,fontSize: 30.0,fontFamily: 'Arvo'),)),
                          new Text('${movie.voteAverage}/10',
                            style: new TextStyle(color: Colors.white,fontSize: 20.0,fontFamily: 'Arvo'),)
                        ],
                      ),
                    ),
                    new Text(movie.overview,style: new TextStyle(color: Colors.white,fontFamily: 'Arvo')),
                    new Padding(padding: const EdgeInsets.all(10.0)),
                    new Row(
                      children: <Widget>[
                        new Expanded(
                            child: new Container(
                              width: 150.0,
                              height: 60.0,
                              alignment: Alignment.center,
                              child: new Text('Rate Movie',
                                style: new TextStyle(color: Colors.white,fontFamily: 'Arvo',fontSize: 20.0),),
                              decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  color: const Color(0xaa3C3261)
                              ),
                            )
                        ),


                      ],
                    )
                  ],
                ),
              ),
            )
          ]
      ),
    );
  }
}