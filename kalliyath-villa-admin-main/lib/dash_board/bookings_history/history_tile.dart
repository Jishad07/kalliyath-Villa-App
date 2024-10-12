import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/bookings/bookings_tab/booking_tile/booking_tile.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/dash_board/bookings_history/last_booking/last_bookings.dart';
import 'package:kalliyath_villa_admin/dash_board/chart/chart.dart';
import 'package:kalliyath_villa_admin/firebase/firebase_get.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

bookingHistoryTile({required Size size}) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 10,
      bottom: 50,
      right: 20,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40, bottom: 15, top: 5),
              child: Text(
                'Bookings History',
                style: apptextstyle(
                    color: AppColors.black,
                    size: 22,
                    family: 'Kalliyath2',
                    weight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: size.height / 3,
              width: size.width / 2.5,
              child: LineChart(mainData()),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                'Last Bookings',
                style: apptextstyle(
                    color: AppColors.black,
                    size: 22,
                    family: 'Kalliyath2',
                    weight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height:size.height / 18,
              width: size.width / 2.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width:size.width / 14,
                    height: size.height / 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Username',
                          style: apptextstyle(
                              color: AppColors.black,
                              size: 15,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Villa',
                          style: apptextstyle(
                              color: AppColors.black,
                              size: 15,
                              family: 'Kalliyath2',
                              weight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width / 14,
                    height:size.height / 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Check-in',
                          style: apptextstyle(
                              color: AppColors.black,
                              size: 15,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Check-out',
                          style: apptextstyle(
                              color: AppColors.black,
                              size: 15,
                              family: 'Kalliyath2',
                              weight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<List>(
                stream: getBookingsStream(),
                builder: (context, snapshot) {
                  List bookings = snapshot.data ?? [];

                  final data = getbooked(bookings);

                  return Column(
                    children: List.generate(
                      data.length > 3 ? 3 : data.length,
                      (index) =>
                          dashboardlastbokingTile(size: size, data: data[index]),
                    ),
                  );
                }),
          ],
        )
      ],
    ),
  );
}
