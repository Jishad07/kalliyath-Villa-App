import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/firebase/firebase_get.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

revenueDatasWidget({required Size size}) {
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
                stream: getvillastream(),
                builder: (ctx, snapshot) {
                  List villas = snapshot.data ?? [];

                  return villas.isEmpty
                      ? Center(
                          child: Text(
                            'No data',
                            style:
                                apptextstyle(color: AppColors.black, size: 15),
                          ),
                        )
                      : ListView.builder(
                          itemCount: villas.length,
                          itemBuilder: (ctx, index) {
                            final data = villas[index].data();

                            final bookingslength =
                                data.containsKey('totalbooking')
                                    ? data['totalbooking'].toString()
                                    : '0';
                            final revennue = data.containsKey('totalrevenue')
                                ? data['totalrevenue'].toString()
                                : '0';

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: size.height / 20,
                                  width: size.width / 30,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              NetworkImage(data['images'][0])),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                SizedBox(
                                  width: size.width / 11,
                                  height: size.height / 15,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(data['name'],
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
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(data['type'],
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
                                  width: size.width / 14,
                                  height: size.height / 15,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(data['bhk'],
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
                                  width: size.width / 14,
                                  height: size.height / 15,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(bookingslength,
                                          style: apptextstyle(
                                              color: AppColors.black,
                                              size: 15,
                                              family: 'Kalliyath2')),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: SizedBox(
                                    width: size.width / 14,
                                    height: size.height / 15,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text('₹$revennue',
                                            style: apptextstyle(
                                                color: AppColors.black,
                                                size: 15,
                                                family: 'Kalliyath2')),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                }),
          ),
        )
      ],
    ),
  );
}
