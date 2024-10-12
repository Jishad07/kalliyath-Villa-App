import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/functions.dart';
import 'package:kalliyath_villa_admin/add_villa/onclick_function/controller.dart';
import 'package:kalliyath_villa_admin/add_villa/onclick_function/onclick.dart';
import 'package:kalliyath_villa_admin/add_villa/dialogue_fields.dart/drop_down.dart';
import 'package:kalliyath_villa_admin/add_villa/dialogue_fields.dart/dialogue_felds.dart';
import 'package:kalliyath_villa_admin/add_villa/dialogue_fields.dart/addvilla_Imagepicker.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/firebase/firebase_get.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';
import 'package:kalliyath_villa_admin/villas/table/table_datas.dart';

bool acistrue = false;
List editchangeslist = [];
addvilla(context, Size size, Map<String, dynamic> details, bool istrue) async {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  AddvillaBloc villa = AddvillaBloc();

  if (villaCategories.isEmpty) {
    return checkCategory(context, size);
  } else {
    if (istrue) {
      await editcontroller(details);
      villa.add(Locationbuilder());
      photo.add(Photobuilderedit());
    } else {
      clearall();
      selectedVilla = null;
      villa.add(AdvillaInitial(istrue: false));
      photo.add(Photobuilder());
    }
  }

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            body: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    istrue ? 'Edit Villa' : 'Add Villa',
                    style: apptextstyle(color: AppColors.black, size: 20),
                  ),
                ],
              ),
              content: SizedBox(
                  width: size.width / 1.2,
                  height: size.height / 1.2,
                  child: Form(
                    key: formkey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DialogueFields(
                          size: size,
                          villa: villa,
                          formkey: formkey,
                          edit: istrue,
                        ),
                        AddVillaImagePicker(
                          details: details,
                          size: size,
                          villa: villa,
                          edit: istrue,
                        )
                      ],
                    ),
                  )),
              actions: [
                Material(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.red,
                  child: InkWell(
                      splashColor: const Color.fromARGB(52, 97, 93, 93),
                      onTap: () {
                        Navigator.of(context).pop();
                        if (!istrue) {
                          detailsbloc.add(Detailsbuilder(istrue: false));
                        } else {
                          detailsbloc.add(Detailsbuilder(istrue: true));
                        }

                        clearall();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          height: size.height / 15,
                          width: size.width / 15,
                          child: Center(
                              child: Text(
                            'Cancel',
                            style:
                                apptextstyle(color: AppColors.white, size: 15),
                          )))),
                ),
                Material(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.blueweb,
                  child: InkWell(
                      splashColor: const Color.fromARGB(52, 97, 93, 93),
                      onTap: () {
                        formsubmit(
                            key: formkey,
                            villa: villa,
                            edit: istrue,
                            context: context,
                            details: details);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          height: size.height / 15,
                          width: size.width / 15,
                          child: Center(
                              child: Text(
                            'Submit',
                            style: apptextstyle(
                                color: AppColors.white,
                                size: 15,
                                weight: FontWeight.w500),
                          )))),
                )
              ],
            ),
          ),
          BlocBuilder<AddvillaBloc, AddvillaState>(
            bloc: villa,
            builder: (context, state) {
              bool istrue = false;
              if (state is Lodingbuilderstate1) {
                istrue = true;
              } else if (state is Lodingbuilderstate2) {
                istrue = false;
              }

              return Visibility(
                  visible: istrue,
                  child: Container(
                    color: const Color.fromARGB(35, 145, 143, 143),
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.blueweb,
                            borderRadius: BorderRadius.circular(15)),
                        height: 200,
                        width: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text('Please wait',
                                  style: apptextstyle(
                                      color: AppColors.white,
                                      size: 19,
                                      weight: FontWeight.w500)),
                            ),
                            const CircularProgressIndicator(
                              color: AppColors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
            },
          ),
        ],
      );
    },
  );
}
