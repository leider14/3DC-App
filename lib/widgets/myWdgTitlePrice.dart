


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget myWdgTitlePrice({
  required String title,
  required double price,
  }
){
  return Text.rich(
    TextSpan(
      text: title,
      style:const TextStyle(fontWeight: FontWeight.bold),
      children: [
        TextSpan(
          text: NumberFormat.simpleCurrency(
            locale: 'en_Us',
            decimalDigits: 0,
          ).format(price),
          style:const TextStyle(fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 149, 59, 53),),
        )
      ]
    )
  );
}