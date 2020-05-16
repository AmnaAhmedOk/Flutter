import 'package:detailsmovie/data_access_layer/models/movie.dart';
import 'package:detailsmovie/repository/movie_repo.dart';
import 'package:flutter/foundation.dart';

class MoviesProvider extends ChangeNotifier{
   List<Result> movies=<Result>[];

   MoviesProvider(){
     fetchMovieList();
   }

   void fetchMovieList()async{
     movies =  await MovieRepo().getMovies();
     notifyListeners();

   }
}