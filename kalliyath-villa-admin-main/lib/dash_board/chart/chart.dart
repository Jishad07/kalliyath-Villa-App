import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/dash_board/chart/functions.dart';
import 'package:kalliyath_villa_admin/firebase/firebase_get.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

LineChartData mainData() {
  return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color.fromARGB(255, 197, 194, 194),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 42,
            getTitlesWidget: (double value, TitleMeta meta) {
              return Text(_getTopTitles(value.toInt(), bookingsforcount),
                  style: apptextstyle(color: AppColors.black, size: 13));
            },
          ),
        ),
        bottomTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 42,
            getTitlesWidget: (double value, TitleMeta meta) {
              if (value == 0 || value == 100) {
                return Text('  ${value.toInt()}%',
                    style: apptextstyle(color: AppColors.black, size: 10));
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 1,
      maxX: 12,
      minY: 0,
      maxY: 100,
      lineTouchData: const LineTouchData(enabled: false),
      lineBarsData: [
        LineChartBarData(
          spots: generateSpots(),
          isCurved: true,
          curveSmoothness: 0.2,
          color: AppColors.blue,
          barWidth: 1,
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.blue, AppColors.white]
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        )
      ]);
}

// List<FlSpot> Spots() {
//   return [
//     FlSpot(1, 10),
//     FlSpot(2, 30),
//     FlSpot(3, 40),
//     FlSpot(4, 20),
//     FlSpot(5, 60),
//     FlSpot(6, 70),
//     FlSpot(7, 80),
//     FlSpot(8, 90),
//     FlSpot(9, 100),
//     FlSpot(10, 50),
//     FlSpot(11, 30),
//     FlSpot(12, 20),
//   ];
// }
String _getTopTitles(int value, List<Map<String, dynamic>> bookingsforcount) {
  Map<int, int> bookingsCountByMonth =
      aggregateBookingsByMonth(bookingsforcount);
  String result = '0';
  if (bookingsCountByMonth.isNotEmpty) {
    bookingsCountByMonth.forEach((month, count) {
      if (value == month) {
        result = count.toString();
      }
    });
  }
  return result;
}
