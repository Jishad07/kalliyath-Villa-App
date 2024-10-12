import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

userTableheadingTile({required Size size}) {
  return Container(
    height: size.height / 10,
    width: size.width / 1.2,
    decoration: BoxDecoration(
        color: const Color.fromARGB(244, 7, 22, 45),
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 54, right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: size.height / 15,
                width: size.width / 25,
                child: Center(
                  child: Text(
                    'Image',
                    style: apptextstyle(
                      color: AppColors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: size.height / 15,
                  width: size.width / 20,
                  child: Center(
                    child: Text(
                      'Name',
                      style: apptextstyle(
                        color: AppColors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: SizedBox(
                  height: size.height / 15,
                  width: size.width / 9,
                  child: Center(
                    child: Text(
                      'UserId',
                      style: apptextstyle(
                        color: AppColors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 60),
                child: SizedBox(
                  height: size.height / 15,
                  width: size.width / 12,
                  child: Center(
                    child: Text(
                      'Email/Phone No',
                      style: apptextstyle(
                        color: AppColors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: size.height / 15,
                  width: size.width / 12,
                  child: Center(
                    child: Text(
                      'Status',
                      style: apptextstyle(
                        color: AppColors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
