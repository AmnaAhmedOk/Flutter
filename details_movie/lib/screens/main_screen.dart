
import 'package:detailsmovie/data_access_layer/models/movie.dart';
import 'package:detailsmovie/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'details_movie.dart';

class MainMoviesProvider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider<MoviesProvider>(
        create: (BuildContext context) {
          return MoviesProvider();
        },
        child:MoviesBody()  ,

      ),
    );
  }

}

class MoviesBody extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<MoviesProvider>(


        builder: (BuildContext context , MoviesProvider moviesList, Widget child)=>
      ListView.builder(
        itemCount:moviesList.movies.length ,
          itemBuilder: (BuildContext context,i){
          return movieRow(moviesList.movies[i],context);
          },

      )

      ,
    );
  }

}
Widget movieRow(Result movie,context) {
    var image_url = 'https://image.tmdb.org/t/p/w500/';
    print("  title  "+movie.title);

    return GestureDetector(

        onTap: () {
          Navigator.push(context, new MaterialPageRoute(builder: (context){
            return new MovieDetails(movie);

          }));
        },
        child: Card(
          margin: const EdgeInsets.all(5.0),

          child: Column(

          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 64,
                  maxHeight: 164,
                ),
                child: Hero(
                  tag: movie,
                   child: Image.network(image_url+movie.posterPath, fit: BoxFit.cover),),
              ),

              title: Text(movie.title
                , style: TextStyle(
                  fontSize: 20,
                ),
              ),

              subtitle:

              Text(movie.voteAverage.toString()

                , style: TextStyle(
                  color: Colors.white70,

                ),
              ),


            /*

           Container(
              height: 75,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movie.genre.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new Chip(
                        label: Text(movie.genre[index])
                    );
                  }
              ),
            )*/

            ) ],

        ),

        )
    );
  }




