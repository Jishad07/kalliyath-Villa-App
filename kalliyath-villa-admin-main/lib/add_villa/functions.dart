import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/onclick_function/controller.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/main_page/bloc/main_page_bloc.dart';
import 'package:kalliyath_villa_admin/main_page/side_tile.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';
import 'package:kalliyath_villa_admin/widgets/sidebar_widget/sidebar.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

pickLocation(BuildContext context, AddvillaBloc villa) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Select Location',
                  style: apptextstyle(color: AppColors.black, size: 20)),
            ],
          ),
          content: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2.2,
              child: OpenStreetMapSearchAndPick(
                  buttonWidth: 130,
                  zoomInIcon: Icons.zoom_in_sharp,
                  zoomOutIcon: Icons.zoom_out,
                  locationPinIconColor: AppColors.red,
                  locationPinTextStyle:
                      apptextstyle(color: AppColors.black, size: 12),
                  buttonColor: AppColors.blueweb,
                  buttonText: 'Pick Location',
                  buttonTextStyle:
                      apptextstyle(color: AppColors.white, size: 12),
                  onPicked: (pickedData) {
                    final data = {
                      'latitude': pickedData.latLong.latitude,
                      'longitude': pickedData.latLong.longitude,
                    };
                    location = data as LinkedHashMap<String, dynamic>;
                    locationaddress = pickedData.address;
                    villa.add(Locationbuilder());
                    Navigator.pop(context);
                  })),
          actions: [
            Material(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(10),
              color: AppColors.red,
              child: InkWell(
                  splashColor: const Color.fromARGB(52, 97, 93, 93),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      height: MediaQuery.of(context).size.height / 18,
                      width: MediaQuery.of(context).size.width / 18,
                      child: Center(
                          child: Text('Back',
                              style: apptextstyle(
                                  color: AppColors.white,
                                  size: 15,
                                  weight: FontWeight.w500))))),
            ),
          ],
        );
      });
}

checkCategory(context, Size size) {
  showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          backgroundColor: AppColors.white,
          content: SizedBox(
            height: size.height / 19,
            width: size.width / 3,
            child: Text('You need to create a category first !',
                style: apptextstyle(
                    color: AppColors.black, size: 15, weight: FontWeight.w500)),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text(
                  'Cancel',
                  style: apptextstyle(
                      color: AppColors.black,
                      size: 15,
                      weight: FontWeight.w500),
                )),
            TextButton(
                onPressed: () {
                  indexx = 5;
                  currentidx = 5;
                  sidebarindex.add(Indexchange());
                  Navigator.of(ctx).pop();
                },
                child: Text('Create Category',
                    style: apptextstyle(
                        color: AppColors.black,
                        size: 15,
                        weight: FontWeight.w500))),
          ],
        );
      });
}
