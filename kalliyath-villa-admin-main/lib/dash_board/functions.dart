import 'package:cloud_firestore/cloud_firestore.dart';

departureTake(List values) {
  List result = [];
  for (var i in values) {
    DateTime checkinDate = DateTime.parse(i['villa']['checkout']).toLocal();
    DateTime today = DateTime.parse('2024-05-12 00:00:00.000Z');
    if (checkinDate.year == today.year &&
        checkinDate.month == today.month &&
        checkinDate.day == today.day) {
      result.add(i);
    }
  }

  return result;
}

arivalsTake(List values) {
  List result = [];
  for (var i in values) {
    DateTime checkinDate = DateTime.parse(i['villa']['checkin']).toLocal();
    DateTime today = DateTime.now();

    if (checkinDate.year == today.year &&
        checkinDate.month == today.month &&
        checkinDate.day == today.day &&
        i['cancelled'] != true) {
      result.add(i);
    }
  }

  return result;
}

List todayBookings(List values) {
  List result = [];

  for (var i in values) {
    Timestamp bookingTimestamp = i['Bookingdate'];
    DateTime checkinDate = bookingTimestamp.toDate().toLocal();
    DateTime today = DateTime.now();

    if (checkinDate.year == today.year &&
        checkinDate.month == today.month &&
        checkinDate.day == today.day) {
      result.add(i);
    }
  }

  return result;
}

List currentlyStaying(List values) {
  List result = [];

  for (var i in values) {
    DateTime checkinDate = DateTime.parse(i['villa']['checkin']).toLocal();
    DateTime checkoutDate = DateTime.parse(i['villa']['checkout']).toLocal();
    DateTime today = DateTime.now();
    if (i['status'] == false &&
        checkinDate.isBefore(today) &&
        checkoutDate.isAfter(today)) {
      result.add(i);
    }
  }

  return result;
}
