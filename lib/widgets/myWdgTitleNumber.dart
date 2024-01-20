


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget myWdgTitleNumber({
  required String title,
  required double price,
  int decimalDigits = 0
  }
){
  return Text.rich(
    TextSpan(
      text: title,
      style:const TextStyle(fontWeight: FontWeight.bold),
      children: [
        TextSpan(
          text: NumberFormat.decimalPatternDigits(
            decimalDigits: decimalDigits
          ).format(price),
          style:const TextStyle(fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 149, 59, 53),),
        )
      ]
    )
  );
}