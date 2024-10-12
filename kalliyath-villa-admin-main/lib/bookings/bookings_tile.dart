import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/bookings/bookings_tab/booking_tile/booking_tile.dart';
import 'package:kalliyath_villa_admin/bookings/bookings_tab/headings.dart/headings.dart';
import 'package:kalliyath_villa_admin/bookings/cancelled_tab/booking_tile/booking_tile.dart';
import 'package:kalliyath_villa_admin/bookings/cancelled_tab/headings.dart/headings.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';

boookingsTile({required Size size}) {
  return Container(
    color: AppColors.white,
    height: size.height,
    width: size.width,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TabBar(
                dividerColor: AppColors.white,
                indicatorColor: AppColors.black,
                labelColor: AppColors.black,
                tabs: <Widget>[
                  Tab(
                    text: 'Bookings',
                    icon: Icon(
                      Icons.luggage,
                      color: AppColors.lightgreen,
                    ),
                  ),
                  Tab(
                      text: 'Cancelled Bookings',
                      icon: Icon(
                        Icons.no_luggage,
                        color: AppColors.red,
                      )),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Column(
                    children: [
                      headingTile(size: size),
                      bookingTile(size: size),
                    ],
                  ),
                  Column(
                    children: [
                      cancelledheadingTile(size: size),
                      cancelledbookingTile(size: size),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
