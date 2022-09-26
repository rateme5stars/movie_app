import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/bloc/home_cubit.dart';
import 'package:movie_app/home_screen.dart';
import 'package:movie_app/networking/home_repository.dart';
import 'package:movie_app/root_app.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(
      cubit: HomeCubit(
        HomeRepositoryImpl(
          Client(),
        ),
      ),
    ),
  ));
}
