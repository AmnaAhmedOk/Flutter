
import 'dart:convert';
import 'package:http/http.dart' as http;
class HttpClient
{

 // var url = 'https://data_access_layer.api.androidhive.info/json/movies.json';

  // Await the http get response, then decode the json-formatted response.
  Future <Map> getMoviesJSON () async {
    http.Response  response = await http.get('https://api.themoviedb.org/3/discover/movie?page=4&api_key=380d8c64ab31c6718e3cdd8f8914347b');
    if (response.statusCode == 200) {
      return json.decode(response.body);

    } else {
      print('Request failed with status: ${Future.error(Error())}');
    }
  }
}