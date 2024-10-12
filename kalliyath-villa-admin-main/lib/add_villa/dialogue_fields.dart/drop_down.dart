import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/onclick_function/controller.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/firebase/firebase_get.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

AddvillaBloc dropdownupdate = AddvillaBloc();
String? selectedVilla;
dropdownWidget({required Size size}) {
  return Padding(
    padding: const EdgeInsets.only(right: 150),
    child: BlocBuilder<AddvillaBloc, AddvillaState>(
      bloc: dropdownupdate,
      builder: (context, state) {
        if (state is Dropdownbuilderstate) {
          return Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 2),
              ),
            ], color: AppColors.white, borderRadius: BorderRadius.circular(10)),
            height: size.height / 15,
            width: size.width / 6,
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(10),
              padding: const EdgeInsets.only(left: 63, top: 5),
              autofocus: false,
              underline: Container(),
              alignment: Alignment.center,
              value: selectedVilla,
              hint: Text('Select Villa type',
                  style: apptextstyle(color: AppColors.black, size: 15)),
              onChanged: (String? newValue) {
                selectedVilla = newValue;
                if (selectedVilla != null) {
                  type = selectedVilla!;
                }

                dropdownupdate.add(Dropdownbuilder());
              },
              items: getdropdownvalues()
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: apptextstyle(color: AppColors.black, size: 15)),
                );
              }).toList(),
            ),
          );
        }
        return Container();
      },
    ),
  );
}

List<String> getdropdownvalues() {
  List<String> result = [];
  for (var i in villaCategories) {
    result.add(i['category']);
  }

  return result;
}
