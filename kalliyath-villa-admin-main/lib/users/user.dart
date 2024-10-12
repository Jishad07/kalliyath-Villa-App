import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/users/user_table_headings/user_headings.dart';
import 'package:kalliyath_villa_admin/users/user_tile/user_tile.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: AppColors.white,
        height: size.height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [userTableheadingTile(size: size), userTile(size: size)],
          ),
        ),
      ),
    );
  }
}
