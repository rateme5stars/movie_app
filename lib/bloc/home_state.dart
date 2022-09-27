import 'package:movie_app/model/popular_movie_model.dart';

abstract class HomeState {}

class LoadingMovie extends HomeState {}

class GetMovieSuccess extends HomeState {
  final List<PopularMovie> movies;
  GetMovieSuccess(this.movies);
}

class GetMovieFail extends HomeState {
  final String message;
  GetMovieFail(this.message);
}


// class GetUpcomingMovieSuccess extends HomeState {
//   final List<Movie> movies;
//   GetMovieSuccess(this.movies);
// }
