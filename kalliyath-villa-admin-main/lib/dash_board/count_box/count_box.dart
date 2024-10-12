import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

countBox(
    {required Size size,
    required String heading,
    required value,
    required Gradient gradient,
    required IconData icon,
    double toppadding = 20}) {
  return Padding(
    padding: EdgeInsets.only(
      top: toppadding,
      left: 20,
    ),
    child: Container(
      height: size.height / 5,
      width: size.width / 5.5,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 38, 38, 38).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
          border: Border.all(color: AppColors.black, width: .2),
          color: AppColors.blueweb,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  heading,
                  style: apptextstyle(
                      color: AppColors.white,
                      size: 22,
                      family: 'Kalliyath2',
                      weight: FontWeight.w400),
                ),
                Container(
                  height: size.height / 14,
                  width: size.width / 27,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: gradient),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      color: AppColors.white,
                      icon,
                      size: 28,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0, bottom: 10),
            child: Text(
              value,
              style: apptextstyle(
                  color: AppColors.white,
                  size: 27,
                  family: 'Kalliyath2',
                  weight: FontWeight.w200),
            ),
          ),
        ],
      ),
    ),
  );
}
