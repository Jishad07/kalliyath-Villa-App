import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/image_save/imagesave_functions.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';
import 'package:kalliyath_villa_admin/villas/table/table_datas.dart';

aletdilagueDelete(
    {required context,
    required Size size,
    required CollectionReference firebase,
    required Map<String, dynamic> details}) {
  showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          backgroundColor: AppColors.white,
          content: SizedBox(
            height: size.height / 19,
            width: size.width / 3,
            child: Text(
              'Are you sure you want to delete this villa?',
              style: apptextstyle(
                color: AppColors.black,
                weight: FontWeight.w500,
                size: 15,
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () async {
                  detailsbloc.add(Detailsbuilder(istrue: true));
                  Navigator.pop(context);
                  await firebase.doc(details['id']).delete();
                  await firebaseimagedelete(details['images']);
                },
                child: Text(
                  'Yes',
                  style: apptextstyle(
                    color: AppColors.black,
                    weight: FontWeight.w500,
                    size: 15,
                  ),
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text(
                  'No',
                  style: apptextstyle(
                    color: AppColors.white,
                    weight: FontWeight.w500,
                    size: 15,
                  ),
                )),
          ],
        );
      });
}
