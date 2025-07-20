import 'package:flutter/cupertino.dart';
import 'package:movie_app/api/api_maneger.dart';
import 'package:movie_app/model/movie.dart';

class MoviesListProvider extends ChangeNotifier {
  int selectedIndex = 0;
  List<Movies>? moviesList = [];
  String? errorMessage;

  Future<void> getAllMovies() async {
    try {
      var response = await ApiManager.getMovies();
      if (response?.status == 'error') {
        errorMessage = response?.statusMessage;
      } else {
        moviesList = response?.data?.movies?.cast<Movies>();
      }
    } catch (e) {
      errorMessage = e.toString();
    }
  }


}
