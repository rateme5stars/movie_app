import 'package:movie_app/model/popular_movie_model.dart';
import 'package:movie_app/model/upcoming_movie_model.dart';

abstract class HomeState {}

class LoadingMovie extends HomeState {}

class GetPopularMovieSuccess extends HomeState {
  final List<PopularMovie> popularMovies;
  GetPopularMovieSuccess(this.popularMovies);
}

class GetPopularMovieFail extends HomeState {
  final String message;
  GetPopularMovieFail(this.message);
}

class GetUpComingMovieSuccess extends HomeState {
  final List<UpComingMovie> upComingMovies;
  GetUpComingMovieSuccess(this.upComingMovies);
}
