import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kalliyath_villa_admin/firebase/firebase_get.dart';

double calculateDailyIncome() {
  num result = 0;

  for (var i in bookingsforcount) {
    Timestamp bookingTimestamp = i['Bookingdate'];
    DateTime checkinDate = bookingTimestamp.toDate().toLocal();
    DateTime today = DateTime.now();

    if (checkinDate.year == today.year &&
        checkinDate.month == today.month &&
        checkinDate.day == today.day) {
      result += i['price']['total'];
    }
  }

  return result.toDouble();
}

double calculateWeeklyIncome() {
  num result = 0;
  DateTime today = DateTime.now();
  DateTime startOfWeek = today.subtract(
      Duration(days: today.weekday - 1)); // Start of the current week (Monday)
  DateTime endOfWeek = startOfWeek
      .add(const Duration(days: 6)); // End of the current week (Sunday)

  for (var i in bookingsforcount) {
    Timestamp bookingTimestamp = i['Bookingdate'];
    DateTime checkinDate = bookingTimestamp.toDate().toLocal();

    if (checkinDate.isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
        checkinDate.isBefore(endOfWeek.add(const Duration(days: 1)))) {
      result += i['price']['total'];
    }
  }

  return result.toDouble();
}

double calculateMonthlyIncome() {
  num result = 0;
  DateTime today = DateTime.now();
  DateTime startOfMonth = DateTime(today.year, today.month, 1);
  DateTime endOfMonth = DateTime(today.year, today.month + 1, 0);

  for (var i in bookingsforcount) {
    Timestamp bookingTimestamp = i['Bookingdate'];
    DateTime checkinDate = bookingTimestamp.toDate().toLocal();

    if (checkinDate.isAfter(startOfMonth.subtract(const Duration(days: 1))) &&
        checkinDate.isBefore(endOfMonth.add(const Duration(days: 1)))) {
      result += i['price']['total'];
    }
  }

  return result.toDouble();
}

double calculateYearlyIncome() {
  num result = 0;
  DateTime today = DateTime.now();
  DateTime startOfYear = DateTime(today.year, 1, 1);
  DateTime endOfYear = DateTime(today.year + 1, 1, 0);

  for (var i in bookingsforcount) {
    Timestamp bookingTimestamp = i['Bookingdate'];
    DateTime checkinDate = bookingTimestamp.toDate().toLocal();

    if (checkinDate.isAfter(startOfYear.subtract(const Duration(days: 1))) &&
        checkinDate.isBefore(endOfYear.add(const Duration(days: 1)))) {
      result += i['price']['total'];
    }
  }

  return result.toDouble();
}
