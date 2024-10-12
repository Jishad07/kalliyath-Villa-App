import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/bookings/booking_details/booking_tile.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

class BookingDetailsPage extends StatelessWidget {
  const BookingDetailsPage(
      {super.key, required this.details, required this.iscancelledbooking});
  final dynamic details;
  final bool iscancelledbooking;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.white),
          backgroundColor: AppColors.blueweb,
          title: Text('Booking Details',
              style: apptextstyle(color: AppColors.white, size: 20)),
        ),
        body: bookingDataTile(
            size: size, details: details, istrue: iscancelledbooking));
  }
}
