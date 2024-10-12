import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/add_villa/add_villa.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/image_save/imagesave_functions.dart';
import 'package:kalliyath_villa_admin/add_villa/dialogue_fields.dart/addvilla_Imagepicker.dart';

Widget buildImageContainer(dynamic editdata, bool istrue) {
  DecorationImage decorationImage;
  if (editdata is String) {
    decorationImage = DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage(editdata),
    );
  } else if (editdata is Uint8List) {
    decorationImage = DecorationImage(
      fit: BoxFit.cover,
      image: MemoryImage(editdata),
    );
  } else {
    return const SizedBox();
  }

  return Container(
    decoration: BoxDecoration(
      image: decorationImage,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: Center(
          child: IconButton(
            onPressed: () async {
              if (istrue) {
                imagesupdate.remove(editdata);
                if (editchangeslist.contains(editdata)) {
                  editchangeslist.remove(editdata);
                  await firebaseimagedeletesingle(editdata);
                }
                photo.add(Photobuilderedit());
              } else {
                imagesList.remove(editdata);
                photo.add(Photobuilder());
              }
            },
            icon: const Icon(
              Icons.close,
              size: 20,
            ),
          ),
        ),
      ),
    ),
  );
}
