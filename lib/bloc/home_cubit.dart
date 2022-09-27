import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/home_state.dart';
import 'package:movie_app/model/popular_movie_model.dart';
import 'package:movie_app/networking/remote_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  final RemoteRepositoryImpl remoteRepo;

  HomeCubit(this.remoteRepo) : super(LoadingMovie()) {
    getPopularMovies();
  }

  Future<void> getPopularMovies() async {
    final List<PopularMovie> result = await remoteRepo.getPopularMovies(1);
    emit(GetPopularMovieSuccess(result));
  }
}
