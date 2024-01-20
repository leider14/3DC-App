

import 'package:flutter/material.dart';

Widget myWdgButtonOne(
  {
    required String text,
    required VoidCallback onPressed
  }
){
  return ElevatedButton(
    onPressed: (){
      onPressed();
    },
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color.fromARGB(255, 149, 59, 53),
      shadowColor: const Color.fromARGB(150, 0, 0, 0),
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      )
    ),
    child: Text(text),
  );
}