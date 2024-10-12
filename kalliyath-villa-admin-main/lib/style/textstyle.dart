import 'package:flutter/material.dart';

TextStyle apptextstyle(
    {required Color color,
    String family = 'Kalliyath',
    FontWeight weight = FontWeight.normal,
    required double size}) {
  return TextStyle(
      color: color,
      fontSize: size,
      fontFamily: family,
      fontWeight: weight,
      overflow: TextOverflow.visible);
}
