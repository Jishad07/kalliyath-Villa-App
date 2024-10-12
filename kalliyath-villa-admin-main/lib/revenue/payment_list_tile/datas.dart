import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/firebase/firebase_get.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

revenuePaymentsDatasWidget({required Size size}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 5,
                    blurStyle: BlurStyle.outer,
                    spreadRadius: 1,
                    color: Color.fromARGB(255, 157, 154, 154),
                    offset: Offset(0, 3))
              ]),
          height: size.height / 3.2,
          width: size.width / 1.7,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: StreamBuilder<List<dynamic>>(
                stream: getBookingsbyDate(),
                builder: (ctx, snapshot) {
                  List bookings = snapshot.data ?? [];

                  return bookings.isEmpty
                      ? Center(
                          child: Text(
                            'No data',
                            style:
                                apptextstyle(color: AppColors.black, size: 15),
                          ),
                        )
                      : ListView.builder(
                          itemCount: bookings.length,
                          itemBuilder: (ctx, index) {
                            final data = bookings[index].data();
                            Timestamp date = data['Bookingdate'];
                            DateTime paymentdate = date.toDate().toLocal();
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: SizedBox(
                                      width: size.width / 45,
                                      height: size.height / 30,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text((index + 1).toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: apptextstyle(
                                                  color: AppColors.black,
                                                  size: 15,
                                                  family: 'Kalliyath2')),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width / 11,
                                    height: size.height / 15,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(data['address']['name'],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: apptextstyle(
                                                color: AppColors.black,
                                                size: 15,
                                                family: 'Kalliyath2')),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width / 11,
                                    height: size.height / 15,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(data['villa']['name'],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: apptextstyle(
                                                color: AppColors.black,
                                                size: 15,
                                                family: 'Kalliyath2')),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: SizedBox(
                                      width: size.width / 14,
                                      height: size.height / 15,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              DateFormat.yMMMMd().format(
                                                  DateTime.parse(
                                                      paymentdate.toString())),
                                              style: apptextstyle(
                                                  color: AppColors.black,
                                                  size: 15,
                                                  family: 'Kalliyath2')),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 17),
                                    child: SizedBox(
                                      width: size.width / 18,
                                      height: size.height / 15,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              '₹${data['price']['total'].toString()}',
                                              style: apptextstyle(
                                                  color: AppColors.black,
                                                  size: 15,
                                                  family: 'Kalliyath2')),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                }),
          ),
        )
      ],
    ),
  );
}
