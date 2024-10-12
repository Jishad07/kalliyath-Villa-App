import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/dash_board/bloc/dashboard_bloc.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

listTileWidget(
    {required Size size, required user, required data, required bool istrue}) {
  String? selectedvalue;
  selectedvalue = data['status'] == false ? 'Confirmed' : 'Pending';
  DashboardBloc dashbloc = DashboardBloc();
  return BlocBuilder<DashboardBloc, DashboardState>(
    bloc: dashbloc,
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(163, 238, 237, 237),
              borderRadius: BorderRadius.circular(13)),
          height: size.height / 12,
          child: Padding(
            padding: const EdgeInsets.only(left: 2, right: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: size.width / 70,
                  backgroundImage:user['Image']== null ? const AssetImage('assets/images/profile-user.png'): NetworkImage(user['Image']) as ImageProvider ,
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                SizedBox(
                  width: size.width / 11,
                  height: size.height / 15,
                  child: Center(
                    child: Text(data['address']['name'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: apptextstyle(
                            color: AppColors.black,
                            size: 12,
                            family: 'Kalliyath2',
                            weight: FontWeight.w400)),
                  ),
                ),
                SizedBox(
                  width: size.width / 14,
                  height: size.height / 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data['villa']['name'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: apptextstyle(
                              color: AppColors.black,
                              size: 12,
                              family: 'Kalliyath2')),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width / 14,
                  height: size.height / 15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['address']['phonenumber'],
                          style: apptextstyle(
                              color: AppColors.black,
                              size: 12,
                              family: 'Kalliyath2')),
                    ],
                  ),
                ),
                if (istrue == true)
                  Container(
                    height: size.height / 17,
                    width: size.width / 15,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.black,width: .5),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(10),
                        autofocus: false,
                        
                        underline: Container(),
                        alignment: Alignment.center,
                        iconDisabledColor: AppColors.black,
                        iconEnabledColor: AppColors.black,
                        value: selectedvalue,
                        hint: Text(
                          'Status',
                          style: apptextstyle(
                              color: AppColors.white,
                              size: 12,
                              family: 'Kalliyath1',
                              weight: FontWeight.w400),
                        ),
                        onChanged: (String? newValue) {
                          selectedvalue = newValue!;

                          CollectionReference firedata =
                              FirebaseFirestore.instance.collection('Bookings');

                          dashbloc.add(DashListBuiler());
                          firedata.doc(data.id).update({
                            'status':
                                selectedvalue == 'Confirmed' ? false : true
                          });
                        },
                        items: <String>['Confirmed', 'Pending']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: value,
                            child: Text(
                              value,
                              style: apptextstyle(
                                family: 'Kalliyath1',
                                color: value == 'Confirmed'
                                    ? AppColors.lightgreen
                                    : AppColors.red,
                                weight: FontWeight.w400,
                                size: 12,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
