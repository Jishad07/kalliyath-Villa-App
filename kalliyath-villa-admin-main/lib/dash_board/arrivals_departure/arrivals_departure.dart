import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/dash_board/List_tile/heading.dart';
import 'package:kalliyath_villa_admin/dash_board/List_tile/list_tile.dart';
import 'package:kalliyath_villa_admin/firebase/firebase_get.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

userArrivalsDepartureTile(
    {required Size size, required arrivals, required departure}) {
  return Padding(
    padding: const EdgeInsets.only(left: 23, top: 20, right: 23),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.black, width: .5)),
          height: size.height / 2,
          width: size.width / 2.6,
          child: arrivals.isEmpty
              ? Center(
                  child: Text(
                    'No Arraivals Today',
                    style: apptextstyle(
                        color: AppColors.black,
                        size: 18,
                        family: 'Kalliyath2',
                        weight: FontWeight.w400),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 8,
                        left: 20,
                      ),
                      child: Text(
                        'Today Arrivals',
                        style: apptextstyle(
                            color: AppColors.black,
                            size: 22,
                            family: 'Kalliyath2',
                            weight: FontWeight.w400),
                      ),
                    ),
                    arraivalHeading(size: size, istrue: true),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: arrivals.length,
                        itemBuilder: (ctx, index) {
                          final data = arrivals[index];

                          final user = users.firstWhere(
                            (element) => element['id'] == data['user'],
                            orElse: () => {},
                          );
                          return listTileWidget(
                              istrue: true, size: size, user: user, data: data);
                        },
                      ),
                    ),
                  ],
                ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.black, width: .5)),
          height: size.height / 2,
          width: size.width / 2.6,
          child: departure.isEmpty
              ? Center(
                  child: Text(
                  'No Departure Today',
                  style: apptextstyle(
                      color: AppColors.black,
                      size: 18,
                      family: 'Kalliyath2',
                      weight: FontWeight.w400),
                ))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 8,
                        left: 20,
                      ),
                      child: Text(
                        'Today Departure',
                        style: apptextstyle(
                            color: AppColors.black,
                            size: 22,
                            family: 'Kalliyath2',
                            weight: FontWeight.w400),
                      ),
                    ),
                    arraivalHeading(size: size, istrue: false),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: departure.length,
                        itemBuilder: (ctx, index) {
                          final data = departure[index];

                          final user = users.firstWhere(
                            (element) => element['id'] == data['user'],
                            orElse: () => {},
                          );
                          return listTileWidget(
                              istrue: false,
                              size: size,
                              user: user,
                              data: data);
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ],
    ),
  );
}
