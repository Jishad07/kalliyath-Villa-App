import 'package:flutter/material.dart';

import 'package:kalliyath_villa_admin/bookings/bookings_tile.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(body: boookingsTile(size: size));
  }
}
