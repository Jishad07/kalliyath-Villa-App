import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

dashboardlastbokingTile({required Size size, required data}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 5,
      right: 5,
      top: 15,
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(163, 238, 237, 237),
      ),
      height: size.height / 15,
      width: size.width / 2.6,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: size.width / 14,
              height: size.height / 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['address']['name'],
                    style: apptextstyle(
                        color: AppColors.black,
                        size: 13,
                        family: 'Kalliyath2',
                        weight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width / 10,
              height: size.height / 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['villa']['name'],
                    style: apptextstyle(
                        color: AppColors.black,
                        size: 13,
                        family: 'Kalliyath2',
                        weight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width / 14,
              height: size.height / 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMMMMd().format(
                        DateTime.parse(data['villa']['checkin'].toString())),
                    style: apptextstyle(
                        color: AppColors.black,
                        size: 13,
                        family: 'Kalliyath2',
                        weight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width / 14,
              height: size.height / 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMMMMd().format(
                        DateTime.parse(data['villa']['checkin'].toString())),
                    style: apptextstyle(
                        color: AppColors.black,
                        size: 13,
                        family: 'Kalliyath2',
                        weight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
