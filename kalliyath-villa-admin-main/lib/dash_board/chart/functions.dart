import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/firebase/firebase_get.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

Map<int, int> aggregateBookingsByMonth(
    List<Map<String, dynamic>> bookingsforcount) {
  Map<int, int> bookingsCountByMonth = {};

  for (var booking in bookingsforcount) {
    DateTime date = booking['Bookingdate'].toDate();
    int month = date.month;
    if (bookingsCountByMonth.containsKey(month)) {
      bookingsCountByMonth[month] = bookingsCountByMonth[month]! + 1;
    } else {
      bookingsCountByMonth[month] = 1;
    }
  }

  return bookingsCountByMonth;
}

List<FlSpot> generateSpots() {
  Map<int, int> bookingsCountByMonth =
      aggregateBookingsByMonth(bookingsforcount);

  List<FlSpot> spots =
      List.generate(12, (index) => FlSpot((index + 1).toDouble(), 0));

  if (bookingsCountByMonth.isNotEmpty) {
    int currentMonth = DateTime.now().month;

    bookingsCountByMonth.forEach((month, count) {
      double percentage = (count / 30) * 100;
      spots[month - 1] = FlSpot(month.toDouble(), percentage);
    });

    for (int i = 1; i < currentMonth; i++) {
      if (!bookingsCountByMonth.containsKey(i)) {
        spots[i - 1] = FlSpot(i.toDouble(), 0);
      }
    }
  }

  return spots;
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  final style = apptextstyle(color: AppColors.black, size: 15);
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = Text('Jan', style: style);
      break;
    case 2:
      text = Text('Feb', style: style);
      break;
    case 3:
      text = Text('Mar', style: style);
      break;
    case 4:
      text = Text('Apr', style: style);
      break;
    case 5:
      text = Text('May', style: style);
      break;
    case 6:
      text = Text('Jun', style: style);
      break;
    case 7:
      text = Text('Jul', style: style);
      break;
    case 8:
      text = Text('Aug', style: style);
      break;
    case 9:
      text = Text('Sep', style: style);
      break;
    case 10:
      text = Text('Oct', style: style);
      break;
    case 11:
      text = Text('Nov', style: style);
      break;
    case 12:
      text = Text('Dec', style: style);
      break;
    default:
      text = Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}
