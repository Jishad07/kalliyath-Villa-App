import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/add_villa.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/image_save/imagesave_functions.dart';
import 'package:kalliyath_villa_admin/add_villa/dialogue_fields.dart/check_box.dart';
import 'package:kalliyath_villa_admin/add_villa/dialogue_fields.dart/imagebuilder_tile.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';
import 'package:kalliyath_villa_admin/villas/table/table_datas.dart';

final AddvillaBloc photo = AddvillaBloc();

class AddVillaImagePicker extends StatelessWidget {
  const AddVillaImagePicker({
    super.key,
    required this.size,
    required this.villa,
    required this.details,
    required this.edit,
  });
  final bool edit;
  final Size size;
  final AddvillaBloc villa;
  final Map<String, dynamic> details;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      width: size.width / 2,
      height: size.height / 1.4,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('   Facilities',
                style: apptextstyle(color: AppColors.black, size: 17)),
            checkBox(details: details),
            SizedBox(height: size.height / 40),
            Material(
              elevation: 2,
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
              child: BlocBuilder<AddvillaBloc, AddvillaState>(
                bloc: detailsbloc,
                builder: (context, state) {
                  bool istrue = false;
                  if (state is Lodingbuilderstate1) {
                    istrue = true;
                  } else if (state is Lodingbuilderstate2) {
                    istrue = false;
                  }
                  return InkWell(
                      splashColor: const Color.fromARGB(52, 111, 111, 111),
                      onTap: () async {
                        if (!istrue) {
                          filepicker(photo, context, edit);
                        }
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          height: size.height / 15,
                          width: size.width / 15,
                          child: istrue
                              ? Center(
                                  child: SizedBox(
                                    height: size.height / 30,
                                    width: size.width / 60,
                                    child: const CircularProgressIndicator(
                                      color: AppColors.black,
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.add_photo_alternate_outlined,
                                      size: 19,
                                      color: AppColors.lightblue,
                                    ),
                                    Text(
                                      'Choose',
                                      style: apptextstyle(
                                          color: AppColors.black, size: 12),
                                    )
                                  ],
                                ))));
                },
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(
                left: 3,
                top: 10,
              ),
              child: Text(
                'Minimum 4 images required',
                style: apptextstyle(color: AppColors.black, size: 10),
              ),
            ),
            SizedBox(height: size.height / 40),
            Expanded(
              child: BlocBuilder<AddvillaBloc, AddvillaState>(
                bloc: photo,
                builder: (context, state) {
                  if (state is Photobuildereditstate) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.1,
                        crossAxisCount: 3,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 30,
                      ),
                      itemCount: editchangeslist.length + imagesupdate.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < editchangeslist.length) {
                          final String editdata = editchangeslist[index];
                          return buildImageContainer(editdata, true);
                        } else {
                          final Uint8List editdata1 =
                              imagesupdate[index - editchangeslist.length];
                          return buildImageContainer(editdata1, true);
                        }
                      },
                    );
                  } else if (state is Photobuilderstate) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.1,
                        crossAxisCount: 3,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 30,
                      ),
                      itemCount: imagesList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final data = imagesList[index];
                        return buildImageContainer(data, false);
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
