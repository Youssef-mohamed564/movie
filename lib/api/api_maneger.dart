import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/movies_response.dart';

class ApiManager {


  static Future<MoviesResponce?> getMovies() async {
    final response = await http.get(Uri.parse('https://yts.mx/api/v2/list_movies.json'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var movieResponse = MoviesResponce.fromJson(data);

      if (movieResponse.status == 'ok') {
        return movieResponse;
      } else {
        throw Exception(movieResponse.statusMessage ?? 'Unknown API Error');
      }
    } else {
      throw Exception('Failed to fetch movies');
    }
  }

}
