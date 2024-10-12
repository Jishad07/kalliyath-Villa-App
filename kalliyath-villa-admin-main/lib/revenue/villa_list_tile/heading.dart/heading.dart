import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

revenueHeading({required Size size}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text('Top Revenues',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: apptextstyle(
                color: AppColors.black,
                size: 15,
                family: 'Kalliyath2',
                weight: FontWeight.w400)),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
                blurRadius: 5,
                blurStyle: BlurStyle.outer,
                spreadRadius: 1,
                color: Color.fromARGB(255, 157, 154, 154),
                offset: Offset(0, 3))
          ], color: AppColors.white, borderRadius: BorderRadius.circular(13)),
          height: size.height / 15,
          width: size.width / 1.7,
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width / 20,
                  height: size.height / 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Image',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: apptextstyle(
                              color: AppColors.black,
                              size: 12,
                              family: 'Kalliyath2')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: size.width / 11,
                    height: size.height / 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Name',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: apptextstyle(
                                color: AppColors.black,
                                size: 12,
                                family: 'Kalliyath2')),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 11,
                  height: size.height / 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Category',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: apptextstyle(
                              color: AppColors.black,
                              size: 12,
                              family: 'Kalliyath2')),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width / 17,
                  height: size.height / 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Bhk',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: apptextstyle(
                              color: AppColors.black,
                              size: 12,
                              family: 'Kalliyath2')),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width / 14,
                  height: size.height / 15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Bookings',
                          style: apptextstyle(
                              color: AppColors.black,
                              size: 12,
                              family: 'Kalliyath2')),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width / 14,
                  height: size.height / 15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Revenue',
                          style: apptextstyle(
                              color: AppColors.black,
                              size: 12,
                              family: 'Kalliyath2')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
