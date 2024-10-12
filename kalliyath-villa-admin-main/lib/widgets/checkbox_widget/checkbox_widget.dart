import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget(
      {super.key,
      required this.istrue,
      required this.ontap,
      required this.text});
  final Function ontap;
  final bool istrue;
  final String text;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(text,
          style: apptextstyle(
            color: AppColors.black,
            size: 13,
          )),
      activeColor: Colors.black,
      value: istrue,
      onChanged: (value) {
        ontap(value);
      },
    );
  }
}
