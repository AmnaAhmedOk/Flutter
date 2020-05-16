
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class HttpClient
{

 // var url = 'https://data_access_la00000yer.api.androidhive.info/json/movies.json';

  // Await the http get response, then decode the json-formatted response.
  Future<dynamic> getMoviesJSON () async {
    http.Response  response = await http.get('https://api.androidhive.info/json/movies.json');

    if (response.statusCode == 200) {
      print("res  "+        response.body.toString());
    return convert.jsonDecode(response.body);
    } else {
      print('Request failed with status: ${Future.error(Error())}');
    }
  }
}