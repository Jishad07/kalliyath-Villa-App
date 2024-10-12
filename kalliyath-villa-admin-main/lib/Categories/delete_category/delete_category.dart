import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/Categories/add_update_categories/add_update_categories.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/firebase/firebase_get.dart';
import 'package:kalliyath_villa_admin/main_page/bloc/main_page_bloc.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

deleteCategory(context, id, categories, Size size, categoryloading, String text,
    bool notedit) {
  bool istrue = villaDetails.any(
    (element) => element['type'] == text,
  );
  showDialog(
      context: context,
      builder: (ctx) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: AlertDialog(
            backgroundColor: AppColors.white,
            content: SizedBox(
              height: size.height / 19,
              width: size.width / 3,
              child: Center(
                child: Text(
                  notedit != true
                      ? istrue
                          ? 'This category includes details. You cannot delete it.'
                          : 'Are you sure you want to delete this category?'
                      : 'This category includes details. You cannot edit it.',
                  style: apptextstyle(
                      color: AppColors.black,
                      size: 15,
                      weight: FontWeight.w500),
                ),
              ),
            ),
            actions: istrue
                ? [
                    Center(
                      child: TextButton(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          child: Text('Back',
                              style: apptextstyle(
                                  color: AppColors.black,
                                  size: 15,
                                  weight: FontWeight.w500))),
                    )
                  ]
                : [
                    TextButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          categoryloading.add(LoadingCircular());
                          await categories.doc(id).delete();
                          blocCategories.add(CategoriesBuild());
                        },
                        child: Text(
                          'Yes',
                          style: apptextstyle(
                              color: AppColors.black,
                              size: 15,
                              weight: FontWeight.w500),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text(
                          'No',
                          style: apptextstyle(
                              color: AppColors.black,
                              size: 15,
                              weight: FontWeight.w500),
                        )),
                  ],
          ),
        );
      });
}
