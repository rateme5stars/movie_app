import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/home_state.dart';
import 'package:movie_app/model/popular_movie_model.dart';
import 'package:movie_app/networking/remote_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepositoryImpl remoteRepo;

  HomeCubit(this.remoteRepo) : super(LoadingMovie()) {
    getListMovie();
  }

  Future<void> getListMovie() async {
    final List<PopularMovie> result = await remoteRepo.getListMovie(1);

    emit(GetMovieSuccess(result));
  }
}
