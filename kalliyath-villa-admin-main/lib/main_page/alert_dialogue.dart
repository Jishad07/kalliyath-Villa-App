import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/login_page/login_page.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showSignOutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final size = MediaQuery.of(context).size;
      return AlertDialog(
        title: Text(
          'Confirm Logout Out',
          style: apptextstyle(color: AppColors.black, size: 17),
        ),
        content: SizedBox(
            width: size.width / 3.5,
            child: Text('Are you sure you want to logout out?',
                style: apptextstyle(color: AppColors.black, size: 14))),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel',
                style: apptextstyle(color: AppColors.black, size: 12)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Logout Out',
                style: apptextstyle(color: AppColors.black, size: 12)),
            onPressed: () async {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (ctx) => LoginPage()),
                  (route) => false);
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
            },
          ),
        ],
      );
    },
  );
}
