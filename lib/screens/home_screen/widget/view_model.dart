import 'package:flutter/cupertino.dart';

import 'movie_model.dart';

class ViewModel extends ChangeNotifier {
  List<Movie> _movies = [
    Movie(title: '1917', image: 'assets/images/movie1.jpg', rating: 7.7),
    Movie(title: 'Captain Marvel', image: 'assets/images/movie2.jpg', rating: 7.7),
    Movie(title: 'The Dark Knight', image:' assets/images/movie3.jpg', rating: 7.7),
  ];

  List<Movie> get movies => _movies;
  void addMovie(Movie movie) {
    _movies.add(movie);
    notifyListeners();
  }
}