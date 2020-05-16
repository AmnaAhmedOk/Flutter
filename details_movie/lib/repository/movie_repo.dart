

import 'package:detailsmovie/data_access_layer/models/movie.dart';
import 'package:detailsmovie/data_access_layer/api/models/movie_api.dart';

class MovieRepo{
  Future<List<Result>> getMovies()async
  {
    print("ressssssss rrr  "+ MovieApi().fetchMovies().toString());

    return await MovieApi().fetchMovies();
  }
}