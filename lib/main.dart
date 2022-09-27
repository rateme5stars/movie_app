import 'package:flutter/material.dart';
import 'package:movie_app/screen/root_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootScreen(),
    ),
  );
}
// HomeScreen(
//       cubit: HomeCubit(
//         HomeRepositoryImpl(
//           Client(),
//         ),
//       ),
//     ),