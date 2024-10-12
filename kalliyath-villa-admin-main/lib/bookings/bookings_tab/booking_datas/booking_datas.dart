import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:kalliyath_villa_admin/bookings/booking_details/booking_details.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

bookingDatasTile(
    {required Size size,
    required String image,
    required String name,
    required String orderid,
    required BuildContext context,
    required String totalamount,
    required dynamic details}) {
  return Container(
    height: size.height / 10,
    width: size.width / 1.2,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 45, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: size.height / 15,
                  width: size.width / 25,
                  child: Center(
                      child:
                          Image(fit: BoxFit.cover, image: NetworkImage(image))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: SizedBox(
                  height: size.height / 15,
                  width: size.width / 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(name,
                          style:
                              apptextstyle(color: AppColors.black, size: 16)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: SizedBox(
                  height: size.height / 15,
                  width: size.width / 9,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(251, 181, 218, 237),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          orderid,
                          style: apptextstyle(color: AppColors.black, size: 12),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 45,
                  right: 10,
                ),
                child: SizedBox(
                  height: size.height / 15,
                  width: size.width / 17,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '₹ $totalamount',
                        style: apptextstyle(color: AppColors.black, size: 16),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2, right: 40),
                child: SizedBox(
                  height: size.height / 20,
                  width: size.width / 20,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => BookingDetailsPage(
                                  iscancelledbooking: false,
                                  details: details,
                                )));
                      },
                      child: Container(
                        height: size.height / 20,
                        width: size.width / 20,
                        decoration: BoxDecoration(
                            color: AppColors.lightgreen,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text(
                            'Details',
                            style: TextStyle(
                                color: AppColors.white,
                                fontFamily: "Kalliyath"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 60, left: 10),
                child: SizedBox(
                  height: size.height / 20,
                  width: size.width / 17,
                  child: Center(
                      child: Text(
                          DateFormat.yMMMMd().format(DateTime.parse(
                              details['villa']['checkin'].toString())),
                          style: apptextstyle(
                              color: AppColors.black,
                              size: 14,
                              weight: FontWeight.w900,
                              family: 'Kalliyath1'))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 33,
                ),
                child: SizedBox(
                  height: size.height / 20,
                  width: size.width / 17,
                  child: Center(
                      child: Text(
                          DateFormat.yMMMMd().format(DateTime.parse(
                              details['villa']['checkout'].toString())),
                          style: apptextstyle(
                              color: AppColors.black,
                              size: 14,
                              weight: FontWeight.w900,
                              family: 'Kalliyath1'))),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
