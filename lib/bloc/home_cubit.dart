import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/home_state.dart';
import 'package:movie_app/model/popular_movie_model.dart';
import 'package:movie_app/model/upcoming_movie_model.dart';
import 'package:movie_app/networking/remote_repository.dart';
import 'package:queue/queue.dart';

class HomeCubit extends Cubit<HomeState> {
  final RemoteRepositoryImpl remoteRepo;

  HomeCubit(this.remoteRepo) : super(LoadingMovie()) {
    // getUpcomingMovies();
    getPopularMovies();
  }

  Future<void> getPopularMovies() async {
    final List<PopularMovie> result = await remoteRepo.getPopularMovies(1);
    emit(GetPopularMovieSuccess(result));
  }

  // Future<void> getUpcomingMovies() async {
  //   final List<UpComingMovie> result = await remoteRepo.getUpcomingMovies(1);
  //   emit(GetUpComingMovieSuccess(result));
  // }

  // Future<void> getMovies() async {
  //   final requestQueue = Queue(parallel: 2);
  //   final List<PopularMovie> popularMovies =
  //       await requestQueue.add(() => remoteRepo.getPopularMovies(1));
  //   final List<UpComingMovie> upcomingMovies =
  //       await requestQueue.add(() => remoteRepo.getUpcomingMovies(1));

  //   emit(GetPopularMovieSuccess(popularMovies));
  //   emit(GetUpComingMovieSuccess(upcomingMovies));
  // }
}
