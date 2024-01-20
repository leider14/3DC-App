

import 'package:flutter/material.dart';

Widget myWdgTitle(
  String title
){
  return Text(
    title,
    style: TextStyle(
      color: Color.fromARGB(255, 22, 33, 58),
      fontWeight: FontWeight.bold,
      fontSize:20,
      height: 0
    ),
    maxLines: 1,
  );

}