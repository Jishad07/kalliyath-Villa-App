import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';
import 'package:kalliyath_villa_admin/villas/details/villa_checkbox.dart';

facilitiesTile({required Size size, required Map<String, dynamic> details}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 42, top: 15, right: 40),
        child: Text(
          'Facilities :',
          style: apptextstyle(
            color: AppColors.white,
            size: 18,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 27, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            villacheckbox(
                size: size.width / 15, text: 'Ac', istrue: details['ac']),
            villacheckbox(
                size: size.width / 12, text: 'Wifi', istrue: details['wifi']),
            villacheckbox(
                size: size.width / 10,
                text: 'Parking',
                istrue: details['parking']),
            villacheckbox(
                size: size.width / 15, text: 'Tv', istrue: details['tv']),
            villacheckbox(
                size: size.width / 7,
                text: 'Swimming Pool',
                istrue: details['swimmingpool']),
            villacheckbox(
                size: size.width / 8,
                text: 'Play Ground',
                istrue: details['playground']),
            villacheckbox(
                size: size.width / 8,
                text: 'Spa Facilities',
                istrue: details['spa']),
            villacheckbox(
                size: size.width / 8,
                text: 'Fitness Center',
                istrue: details['fitness']),
          ],
        ),
      )
    ],
  );
}
