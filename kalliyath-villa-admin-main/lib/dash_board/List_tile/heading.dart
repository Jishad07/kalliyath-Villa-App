import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

arraivalHeading({required Size size, required bool istrue}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
    child: Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(163, 238, 237, 237),
          borderRadius: BorderRadius.circular(13)),
      height: size.height / 20,
      child: Padding(
        padding: EdgeInsets.only(left: istrue == true ? 20 : 43, right: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Image',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: apptextstyle(
                    color: AppColors.black,
                    size: 11,
                    family: 'Kalliyath2',
                    weight: FontWeight.w400)),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 40),
              child: Text('Username',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: apptextstyle(
                      color: AppColors.black,
                      size: 11,
                      family: 'Kalliyath2',
                      weight: FontWeight.w400)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text('Villa',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: apptextstyle(
                      color: AppColors.black, size: 11, family: 'Kalliyath2')),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text('Phone Number',
                  style: apptextstyle(
                      color: AppColors.black, size: 11, family: 'Kalliyath2')),
            ),
            if (istrue == true)
              Text('Status',
                  style: apptextstyle(
                      color: AppColors.black, size: 11, family: 'Kalliyath2')),
          ],
        ),
      ),
    ),
  );
}
