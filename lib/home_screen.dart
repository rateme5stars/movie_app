import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/home_cubit.dart';
import 'package:movie_app/bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.cubit}) : super(key: key);
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      builder: (_, state) {
        if (state is GetMovieSuccess) {
          return const Scaffold(
            body: Center(child: Text('Success')),
          );
        }
        return const Scaffold(
          body: Center(child: Text('No Data')),
        );
      },
    );
  }
}
