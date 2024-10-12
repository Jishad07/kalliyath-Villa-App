import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/bookings/bloc/booking_bloc.dart';
import 'package:kalliyath_villa_admin/bookings/booking_details/booking_details.dart';
import 'package:kalliyath_villa_admin/bookings/cancelled_tab/booking_tile/booking_tile.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

cancelledbookingDatasTile(
    {required Size size,
    required String image,
    required String name,
    required String bookingid,
    required BuildContext context,
    required String totalamount,
    required dynamic details}) {
  String? selectedvalue = details['refund'] == true ? 'Paid' : 'Not Paid';
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
                padding: const EdgeInsets.only(left: 45),
                child: SizedBox(
                  height: size.height / 15,
                  width: size.width / 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: apptextstyle(color: AppColors.black, size: 16),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
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
                          bookingid,
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
                padding: const EdgeInsets.only(left: 12, right: 27),
                child: SizedBox(
                  height: size.height / 20,
                  width: size.width / 20,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => BookingDetailsPage(
                                  iscancelledbooking: true,
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
              details['refund'] == true
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        height: size.height / 18,
                        width: size.width / 12,
                        child: Center(
                          child: Text(
                            selectedvalue,
                            style: apptextstyle(
                                color: AppColors.lightgreen, size: 15),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: size.height / 18,
                        width: size.width / 12,
                        decoration: BoxDecoration(
                            color: AppColors.blueweb,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(10),
                            autofocus: false,
                            underline: Container(),
                            alignment: Alignment.center,
                            iconDisabledColor: AppColors.white,
                            iconEnabledColor: AppColors.white,
                            value: selectedvalue,
                            hint: Text(
                              'Change Status',
                              style: apptextstyle(
                                  color: AppColors.white,
                                  size: 12,
                                  family: 'Kalliyath1',
                                  weight: FontWeight.w400),
                            ),
                            onChanged: (String? newValue) async {
                              selectedvalue = newValue!;
                              CollectionReference firedata = FirebaseFirestore
                                  .instance
                                  .collection('Bookings');
                              await firedata.doc(bookingid).update({
                                'refund': selectedvalue == 'Paid' ? true : false
                              });
                              cancelledbookingbloc.add(Bookingbuilder());
                            },
                            items: <String>['Paid', 'Not Paid']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    color: value == 'Paid'
                                        ? AppColors.lightgreen
                                        : AppColors.red,
                                    fontFamily: "Kalliyath",
                                    fontSize: 15,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ],
    ),
  );
}
