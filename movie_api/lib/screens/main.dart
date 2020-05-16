import 'package:flutter/material.dart';
import 'package:movieapi/bloc/MovieBloc.dart';
import 'package:movieapi/data_access_layer/model/Movie.dart';
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
      home: new MyMoviesList(),
    );
  }

}

class MyMoviesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MoviesListState ();
  }
}

class MoviesListState extends State<MyMoviesList> {
  //future
  final Set<Movie> _saved = <Movie>{};
  final _movies = MovieBloc().fetchMoviesList();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Movies List"),
      )
      ,
      body: _buildMovies(),
        );

  }
Widget _buildMovies() {
  return Container(
    child: FutureBuilder(
      future: _movies,
      builder: (_, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        else {
          return _buildList(snapshot.data);
        }
      },
    ),
  );
}

  Widget _buildList(data){
    return  ListView.separated(
        itemCount: data.length,
        padding: EdgeInsets.all(8.0),

    separatorBuilder: (BuildContext context, int index) {
      return Divider();
    },
        itemBuilder: (BuildContext context, int index) {
          return  movieRow(data[index]) ;

        }

/*
        itemCount: data.length,
        itemBuilder:(BuildContext context , int index){
         /* if (index >= data.length) {
            data.addAll(().take(10)); /*4*/
          }*/
          return  movieRow(data[index]) ;
        }
 */

    );
  }
  Widget movieRow(Movie movie) {
    final alreadySaved = _saved.contains(movie);

    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              /*leading: CircleAvatar(
          backgroundImage: NetworkImage(
              movie.image
          ),
        ),
*/
              /*   leading: SizedBox(
            height: 200.0,
            width: 100.0, // fixed width and height
            child: Image.network(movie.image)
        ),*/
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 64,
                  maxHeight: 164,
                ),
                child: Image.network(movie.image, fit: BoxFit.cover),
              ),
              title: Text(movie.title
                , style: TextStyle(
                  fontSize: 20,
                ),
              ),

              subtitle:

              Text(movie.rating.toString()

                , style: TextStyle(
                  color: Colors.deepPurple,

                ),
              ),
              trailing: Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Colors.red : null,),
              onTap: () {
                setState(() {
                  if (alreadySaved) {
                    _saved.remove(movie);
                  } else {
                    _saved.add(movie);
                  }
                });
              },
            ),


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
            )

          ],

        ),

    );
  }
    Widget chipsList(gener){
      return Wrap(
        spacing: 6.0,
        runSpacing: 6.0,
        children: List<Widget>.generate(gener.length, (int index) {
          return Chip(
            label: Text(gener[index])
          );

        }),
      );
    }

  }


  /*addToFav(String isFavoraite ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("fav",isFavoraite);
  }
  removeFromFav(String isFavoraite ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("fav");
  }*/


