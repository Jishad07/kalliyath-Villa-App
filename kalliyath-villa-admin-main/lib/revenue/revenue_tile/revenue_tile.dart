import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/dash_board/count_box/count_box.dart';
import 'package:kalliyath_villa_admin/revenue/payment_list_tile/datas.dart';
import 'package:kalliyath_villa_admin/revenue/payment_list_tile/heading.dart';
import 'package:kalliyath_villa_admin/revenue/villa_list_tile/datas.adrt/datas.dart';
import 'package:kalliyath_villa_admin/revenue/villa_list_tile/heading.dart/heading.dart';
import 'package:kalliyath_villa_admin/revenue/revenue.dart';

revenueTile({required Size size}) {
  return Container(
    height: size.height,
    width: size.width,
    color: AppColors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            countBox(
                toppadding: 5,
                size: size,
                heading: 'Daily income',
                value: '₹$dailyIncome',
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 158, 240, 6),
                  Color.fromARGB(255, 207, 238, 155)
                ]),
                icon: Icons.currency_rupee),
            countBox(
                size: size,
                heading: 'Weekly income',
                value: '₹$weeklyIncome',
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 6, 240, 174),
                  Color.fromARGB(255, 155, 238, 212)
                ]),
                icon: Icons.currency_rupee),
            countBox(
                size: size,
                heading: 'Monthly income',
                value: '₹$monthlyIncome',
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 244, 13, 102),
                  Color.fromARGB(255, 236, 109, 153)
                ]),
                icon: Icons.currency_rupee),
            countBox(
                size: size,
                heading: 'Yearly income',
                value: '₹$yearlyIncome',
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 241, 198, 7),
                  Color.fromARGB(255, 238, 211, 135)
                ]),
                icon: Icons.currency_rupee),
            const SizedBox(
              height: 5,
            )
          ],
        ),
        Column(
          children: [
            revenueHeading(size: size),
            revenueDatasWidget(size: size),
            revenuePaymentHeading(size: size),
            revenuePaymentsDatasWidget(size: size)
          ],
        ),
      ],
    ),
  );
}
