import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movie_app/theme/theme.dart';

class MyTextField extends StatelessWidget {
  final bool isPasswordTextField;
  final String hintText;
  const MyTextField({
    Key? key,
    required this.hintText,
    required this.isPasswordTextField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      padding: const EdgeInsets.only(left: 10, right: 10),
      height: 55,
      decoration: BoxDecoration(
        color: textField,
        borderRadius: BorderRadius.circular(3),
      ),
      child: isPasswordTextField
          ? Center(
              child: TextField(
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 18, color: hintTextColor),
                  suffixText: 'SHOW',
                  suffixStyle: TextStyle(color: hintTextColor),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            )
          : Center(
              child: TextField(
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 18, color: hintTextColor),
                ),
              ),
            ),
    );
  }
}


// TextField(
//         style: const TextStyle(color: Colors.white),
//         cursorColor: Colors.white,
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           hintText: hintText,
//           hintStyle: TextStyle(fontSize: 18, color: hintTextColor),
//         ),
//       ),