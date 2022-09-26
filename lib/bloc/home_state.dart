import 'package:movie_app/model/movie_model.dart';

abstract class HomeState {}

class HomeInit extends HomeState {}

class GetMovieSuccess extends HomeState {
  final List<Movie> movies;
  GetMovieSuccess(this.movies);
}

class GetMovieFail extends HomeState {
  final String message;
  GetMovieFail(this.message);
}
