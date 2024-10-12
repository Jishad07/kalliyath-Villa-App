import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/bookings/bookings_tab/booking_tile/booking_tile.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/dash_board/arrivals_departure/arrivals_departure.dart';
import 'package:kalliyath_villa_admin/dash_board/bookings_history/history_tile.dart';
import 'package:kalliyath_villa_admin/dash_board/count_box/count_box.dart';
import 'package:kalliyath_villa_admin/dash_board/functions.dart';
import 'package:kalliyath_villa_admin/firebase/firebase_get.dart';

class DashBoardTile extends StatefulWidget {
  const DashBoardTile({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<DashBoardTile> createState() => _DashBoardTileState();
}

class _DashBoardTileState extends State<DashBoardTile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<List>(
        future: getbookings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: widget.size.height,
              width: widget.size.width,
              child: const Center(
                  child: SizedBox(
                height: 55,
                width: 55,
                child: CircularProgressIndicator(
                  color: AppColors.black,
                ),
              )),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final bookings = snapshot.data ?? [];
            final departure = departureTake(bookings);
            final arrivals = arivalsTake(bookings);
            return SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<List>(
                      future: getvilla(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: SizedBox(
                            height: 55,
                            width: 55,
                            child: CircularProgressIndicator(
                              color: AppColors.black,
                            ),
                          ));
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          final villas = snapshot.data ?? [];

                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                countBox(
                                  gradient: const LinearGradient(colors: [
                                    Color(0xFFEA580C),
                                    Color(0xFFFB923C)
                                  ]),
                                  icon: Icons.content_paste_outlined,
                                  size: widget.size,
                                  heading: 'Total Bookings',
                                  value: '${getbooked(bookings).length}',
                                ),
                                countBox(
                                  gradient: const LinearGradient(colors: [
                                    Color.fromARGB(255, 7, 201, 7),
                                    Color(0xFF34D399)
                                  ]),
                                  icon: Icons.luggage,
                                  size: widget.size,
                                  heading: 'Today Bookings',
                                  value: '${todayBookings(bookings).length}',
                                ),
                                countBox(
                                  gradient: const LinearGradient(colors: [
                                    Color.fromARGB(255, 243, 41, 41),
                                    Color.fromARGB(255, 221, 88, 88)
                                  ]),
                                  icon: Icons.home_outlined,
                                  size: widget.size,
                                  heading: 'Currently Staying',
                                  value: '${currentlyStaying(bookings).length}',
                                ),
                                countBox(
                                  gradient: const LinearGradient(colors: [
                                    Color.fromARGB(255, 223, 223, 148),
                                    Color.fromARGB(255, 207, 205, 63)
                                  ]),
                                  icon: Icons.event_available,
                                  size: widget.size,
                                  heading: 'Available Villas',
                                  value: '${villas.length}',
                                ),
                              ],
                            ),
                          );
                        }
                      }),
                  userArrivalsDepartureTile(
                      size: widget.size,
                      arrivals: arrivals,
                      departure: departure),
                  bookingHistoryTile(size: widget.size)
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
