import 'package:movieapi/data_access_layer/model/Movie.dart';
import 'package:movieapi/data_access_layer/network_client.dart';

class MovieApi{
  Future<List<Movie>> fetchMovies() async{
    var res = await HttpClient().getMoviesJSON();
   return  List <Movie>.from(res.map((jsonEntry) => Movie.fromJson(jsonEntry)));

  }
}