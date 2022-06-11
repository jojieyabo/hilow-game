// ignore_for_file: non_constant_identifier_names, deprecated_member_use, sized_box_for_whitespace

import 'package:flutter/material.dart';

TextStyle txtStyle(double size, Color color) {
  return TextStyle(
    fontFamily: ('PressStart'),
    fontSize: size,
    fontWeight: FontWeight.bold,
    color: color,
  );
}

Widget Cards(String card) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: Container(
      height: 180.0,
      width: 90.0,
      child: Image.asset(card),
    ),
  );
}

Widget Buttonss(String simbolo) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
          height: 60, width: 120, color: Color.fromARGB(255, 255, 255, 255), child: Text(simbolo,
          textAlign: TextAlign.center,
           style: TextStyle(fontSize: 20),)));
}
