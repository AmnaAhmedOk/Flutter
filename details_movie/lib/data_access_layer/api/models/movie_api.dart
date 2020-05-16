
import 'package:detailsmovie/data_access_layer/models/movie.dart';
import 'package:detailsmovie/data_access_layer/network_client.dart';

class MovieApi{
  Future<List<Result>> fetchMovies() async{
    //    var data = await getJson();
    var res = await HttpClient().getMoviesJSON();
    var movies = res['results'];
   return  List <Result>.from(movies.map((jsonEntry) => Result.fromJson(jsonEntry)));

  }
}
