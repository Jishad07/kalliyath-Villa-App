import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/revenue/functions.dart';
import 'package:kalliyath_villa_admin/revenue/revenue_tile/revenue_tile.dart';

class RevenuePage extends StatefulWidget {
  const RevenuePage({super.key});

  @override
  State<RevenuePage> createState() => _RevenuePageState();
}

double dailyIncome = 0;
double weeklyIncome = 0;
double monthlyIncome = 0;
double yearlyIncome = 0;

class _RevenuePageState extends State<RevenuePage> {
  @override
  void initState() {
    dailyIncome = calculateDailyIncome();
    weeklyIncome = calculateWeeklyIncome();
    monthlyIncome = calculateMonthlyIncome();
    yearlyIncome = calculateYearlyIncome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(body: revenueTile(size: size));
  }
}
