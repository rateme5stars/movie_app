import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/home_state.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/networking/home_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(LoadingMovie()) {
    getListMovie();
  }

  final HomeRepositoryImpl homeRepo;

  Future<void> getListMovie() async {
    final List<Movie> result = await homeRepo.getListMovie(1);

    emit(GetMovieSuccess(result));
  }
}
