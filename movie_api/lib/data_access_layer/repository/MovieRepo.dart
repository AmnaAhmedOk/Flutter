import 'package:movieapi/data_access_layer/api/MovieApi.dart';
import 'package:movieapi/data_access_layer/model/Movie.dart';

class MovieRepo{
  Future<List<Movie>> getMovies()async
  {
    return await MovieApi().fetchMovies();
  }
}