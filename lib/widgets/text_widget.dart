import 'package:flutter/material.dart';

Widget regularText({
  required String title,
  required double textSize,
  required Color textColor,
  String? textFamily,
  FontWeight? textWeight,
  TextAlign? textAlignment



}){
  return Text(
    textAlign: textAlignment,
      title,
      style: TextStyle(
        fontSize: textSize,
        color: textColor,
        fontWeight: textWeight,
        fontFamily: textFamily,

  ));
}