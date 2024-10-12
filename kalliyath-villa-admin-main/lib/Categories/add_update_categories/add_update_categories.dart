import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/Categories/delete_category/delete_category.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/firebase/firebase_get.dart';
import 'package:kalliyath_villa_admin/main_page/bloc/main_page_bloc.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';
import 'package:kalliyath_villa_admin/widgets/snackbar_widget/snackbar.dart';

TextEditingController _categoriescontroller = TextEditingController();
GlobalKey<FormState> _categorykey = GlobalKey<FormState>();
final CollectionReference _category =
    FirebaseFirestore.instance.collection('Categories');
MainPageBloc blocCategories = MainPageBloc();
addcategories({
  required Size size,
  required BuildContext context,
  required bool istrue,
  String? text,
  String? id,
}) {
  bool nameincludes = false;

  if (istrue) {
    _categoriescontroller.text = text!;
    nameincludes = villaDetails.any(
      (element) => element['type'] == text,
    );
    if (nameincludes) {
      return deleteCategory(context, id, _categoriescontroller.text, size,
          blocCategories, text, true);
    }
  }

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: AlertDialog(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(istrue ? "Edit Category" : 'Add Category',
                    style: apptextstyle(color: AppColors.black, size: 20)),
              ],
            ),
            content: SizedBox(
              width: size.width / 3,
              height: size.height / 12,
              child: Form(
                key: _categorykey,
                child: TextFormField(
                  controller: _categoriescontroller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Category';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: AppColors.white,
                    labelText: 'Category',
                    labelStyle: apptextstyle(color: AppColors.black, size: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              Material(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(10),
                color: AppColors.red,
                child: InkWell(
                    splashColor: const Color.fromARGB(52, 97, 93, 93),
                    onTap: () async {
                      Navigator.of(context).pop();
                      await Future.delayed(const Duration(milliseconds: 500));
                      _categoriescontroller.text = '';
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        height: size.height / 20,
                        width: size.width / 20,
                        child: Center(
                            child: Text('Cancel',
                                style: apptextstyle(
                                    color: AppColors.white,
                                    size: 15,
                                    weight: FontWeight.w500))))),
              ),
              Material(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(10),
                color: AppColors.blueweb,
                child: InkWell(
                    splashColor: const Color.fromARGB(52, 97, 93, 93),
                    onTap: () {
                      categorysubmit(context, istrue, id);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        height: size.height / 20,
                        width: size.width / 20,
                        child: Center(
                            child: Text(istrue ? "Update" : 'Submit',
                                style: apptextstyle(
                                    color: AppColors.white,
                                    size: 15,
                                    weight: FontWeight.w500))))),
              )
            ],
          ),
        );
      });
}

categorysubmit(context, bool update, id) {
  final name = _categoriescontroller.text.trim();
  if (update) {
    if (_categorykey.currentState!.validate()) {
      final istrue = villaCategories.any(
          (element) => element['category'].toLowerCase() == name.toLowerCase());
      if (!istrue) {
        blocCategories.add(LoadingCircular());
        _category.doc(id).update({'category': name});
        _categoriescontroller.text = '';
        blocCategories.add(CategoriesBuild());
        Navigator.of(context).pop();
        snackbarAlert(context, 'Updated');
      } else {
        snackbarAlert(context, 'Category already exist');
      }
    } else {
      snackbarAlert(context, 'Please Enter Category');
    }
  } else {
    if (_categorykey.currentState!.validate()) {
      final istrue = villaCategories.any(
          (element) => element['category'].toLowerCase() == name.toLowerCase());
      if (!istrue) {
        _category.add({'category': name});
        _categoriescontroller.text = '';
        blocCategories.add(CategoriesBuild());
        Navigator.of(context).pop();
        snackbarAlert(context, 'Success');
      } else {
        snackbarAlert(context, 'Category already exist');
      }
    } else {
      snackbarAlert(context, 'Please Enter Category');
    }
  }
}
