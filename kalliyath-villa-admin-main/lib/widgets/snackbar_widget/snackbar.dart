import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

snackbarAlert(context, String messege) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    backgroundColor: const Color.fromARGB(255, 63, 62, 62),
    margin: const EdgeInsets.only(bottom: 60, left: 440, right: 440),
    content: Text(messege,
        textAlign: TextAlign.center,
        style: apptextstyle(
            color: AppColors.white, size: 15, weight: FontWeight.w400)),
  ));
}
