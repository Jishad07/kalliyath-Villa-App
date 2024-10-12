import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:kalliyath_villa_admin/add_villa/add_villa.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/image_save/imagesave_functions.dart';
import 'package:kalliyath_villa_admin/add_villa/onclick_function/controller.dart';
import 'package:kalliyath_villa_admin/add_villa/dialogue_fields.dart/text_field.dart';
import 'package:kalliyath_villa_admin/firebase/firebase_get.dart';
import 'package:kalliyath_villa_admin/villas/table/table_datas.dart';
import 'package:kalliyath_villa_admin/widgets/snackbar_widget/snackbar.dart';

final CollectionReference firedata =
    FirebaseFirestore.instance.collection('VillaDetails');

formsubmit(
    {required GlobalKey<FormState> key,
    required context,
    required AddvillaBloc villa,
    required bool edit,
    required Map<String, dynamic> details}) async {
  if (edit == true) {
    update(key, context, villa, details);
  } else {
    add(key, context, villa, details);
  }
}

add(GlobalKey<FormState> key, context, AddvillaBloc villa,
    Map<String, dynamic> details) async {
  villaname = villaNamecontroller.text.trim();
  description = villaDescriptioncontroller.text.trim();
  price = villaPricecontroller.text.trim();
  bhk = villaBhkcontroller.text.trim();
  perperson = villaperpersoncontroller.text.trim();

  bool istrue = villaDetails
      .any((element) => element['name'] == villaNamecontroller.text.trim());
  if (key.currentState!.validate()) {
    if (istrue) {
      snackbarAlert(context, 'Villa already exist');
      return;
    } else if (type == '') {
      snackbarAlert(context, 'Please select villa type');
      return;
    } else if (location.isEmpty) {
      snackbarAlert(context, 'Please add location');
    } else if (imagesList.isEmpty) {
      snackbarAlert(context, 'Please add images');
    } else if (imagesList.length > 3) {
      villa.add(Lodingbuilder());
      final data =
          await getallvillasdetails(imagesindatabase: [], istrue: false);

      await firedata.add(data);

      villa.add(Lodingbuilder());
      detailsbloc.add(Detailsbuilder(istrue: true));
      detailsimage.add(Villadetailsimageloder(istrue: true));
      Navigator.of(context).pop();

      await snackbarAlert(context, 'Success');

      clearall();
    } else {
      snackbarAlert(context, 'Please add atleast 4 images');
    }
  } else {
    snackbarAlert(context, 'Please fill the form');
  }
}

update(GlobalKey<FormState> key, context, AddvillaBloc villa,
    Map<String, dynamic> details) async {
  villaname = villaNamecontroller.text.trim();
  description = villaDescriptioncontroller.text.trim();
  price = villaPricecontroller.text.trim();
  bhk = villaBhkcontroller.text.trim();

  if (key.currentState!.validate()) {
    if (villaname == '') {
      snackbarAlert(context, 'Please enter Villa name');
      return;
    } else if (type == '') {
      snackbarAlert(context, 'Please select villa type');
      return;
    } else if (location.isEmpty) {
      snackbarAlert(context, 'Please add location');
    } else if (editchangeslist.isEmpty && imagesupdate.isEmpty) {
      snackbarAlert(context, 'Please add images');
    } else if ((editchangeslist.length + imagesupdate.length) > 3) {
      villa.add(Lodingbuilder());
      final data = await getallvillasdetails(
          imagesindatabase: details['images'], istrue: true, id: details['id']);

      await firedata.doc(details['id']).update(data);
      villa.add(Lodingbuilder());
      detailsbloc.add(Detailsbuilder(istrue: true));
      Navigator.of(context).pop();
      await snackbarAlert(context, 'Success');
      clearall();
    } else {
      snackbarAlert(context, 'Please add atleast 4 images');
    }
  } else {
    snackbarAlert(context, 'Please fill the form');
  }
}

clearall() {
  villaNamecontroller.text = '';
  villaDescriptioncontroller.text = '';
  villaBhkcontroller.text = '';
  villaPricecontroller.text = '';
  villaperpersoncontroller.text = '';
  villaname = '';
  description = '';
  location.clear();
  type = '';
  ac = false;
  price = '';
  bhk = '';
  wifi = false;
  parking = false;
  tv = false;
  swimmingpool = false;
  playground = false;
  spa = false;
  fitness = false;
  imagesList.clear();
  imagesupdate.clear();
  editchangeslist.clear();
}
