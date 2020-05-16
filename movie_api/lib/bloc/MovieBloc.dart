
//view model
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:movieapi/data_access_layer/model/Movie.dart';
import 'package:movieapi/data_access_layer/repository/MovieRepo.dart';
class MovieBloc extends BlocBase{
  Future<List<Movie>> fetchMoviesList()async{
    return  await MovieRepo().getMovies();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}