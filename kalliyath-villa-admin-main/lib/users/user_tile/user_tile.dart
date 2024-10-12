import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/bookings/bloc/booking_bloc.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/firebase/firebase_get.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';
import 'package:kalliyath_villa_admin/users/user_table_datas/user_datas.dart';

BookingBloc bookingbloc = BookingBloc();
userTile({required Size size}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20, left: 2, right: 2),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ], color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: BlocBuilder<BookingBloc, BookingState>(
            bloc: bookingbloc,
            builder: (context, state) {
              return FutureBuilder<List>(
                future: getuser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: SizedBox(
                      height: 55,
                      width: 55,
                      child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ));
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final users = snapshot.data ?? [];

                    final reversed = users.reversed.toList();
                    return reversed.isEmpty
                        ? Center(
                            child: Text(
                              'No Users',
                              style: apptextstyle(
                                color: AppColors.black,
                                size: 16,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: reversed.length,
                            itemBuilder: (ctx, index) {
                              final data = reversed[index];

                              return userTableDatasTile(
                                  size: size,
                                  image: data['Image'] !=''? data['Image'] :null,
                                  name: data['Username'] ?? '',
                                  orderid: data.id,
                                  context: context,
                                  details: data);
                            });
                  }
                },
              );
            },
          ),
        ),
      ),
    ),
  );
}
