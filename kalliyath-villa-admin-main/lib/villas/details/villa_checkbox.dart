import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

villacheckbox(
    {required double size, required String text, required bool istrue}) {
  return SizedBox(
    width: size,
    child: CheckboxListTile(
      autofocus: false,
      dense: false,
      enableFeedback: false,
      title: Text(
        text,
        style: apptextstyle(
          color: AppColors.white,
          size: 15,
        ),
      ),
      checkColor: AppColors.white,
      activeColor: AppColors.red,
      value: istrue,
      onChanged: (value) {},
    ),
  );
}
