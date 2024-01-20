import 'package:crt_app/widgets/myWdgTitle.dart';
import 'package:flutter/material.dart';

Widget myWdgContainer({
    required String title,
    required Widget child,
    EdgeInsets? margin,
  }
  ){
  return Container(
    margin: margin,
    padding:const EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          blurRadius: 20,
          offset: Offset(0, 10),
          color: Color.fromARGB(20, 0, 0, 0)
        )
      ]
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        myWdgTitle(title),
        const SizedBox(height: 10,),
        child
      ],
    ),
  );
}