import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';
import 'package:kalliyath_villa_admin/users/bloc/user_bloc.dart';

userTableDatasTile(
    {required Size size,
    required String? image,
    required String name,
    required String orderid,
    required BuildContext context,
    required dynamic details}) {
  String? selectedvalue = details['status'] == true ? 'Blocked' : 'Active';
  UserBloc userupdate = UserBloc();
  return BlocBuilder<UserBloc, UserState>(
    bloc: userupdate,
    builder: (context, state) {
      return Container(
        height: size.height / 10,
        width: size.width / 1.2,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                        height: size.height / 15,
                        width: size.width / 25,
                        child: Image(
                            fit:
                                image != null ? BoxFit.cover : BoxFit.fitHeight,
                            filterQuality: FilterQuality.high,
                            image: image != null
                                ? NetworkImage(image)
                                : const AssetImage(
                                        'assets/images/profile-user.png')
                                    as ImageProvider)),
                  ),
                  SizedBox(
                    height: size.height / 15,
                    width: size.width / 9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          name,
                          style: apptextstyle(
                            color: AppColors.black,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height / 15,
                    width: size.width / 9,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(251, 181, 218, 237),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            orderid,
                            style: apptextstyle(
                              color: AppColors.black,
                              size: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 15,
                    width: size.width / 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${details['Email'] == "" ? details['Phone Number'] : details['Email']}',
                          style: apptextstyle(
                            color: AppColors.black,
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height / 18,
                    width: size.width / 12,
                    decoration: BoxDecoration(
                        color: AppColors.blueweb,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(10),
                        autofocus: false,
                        underline: Container(),
                        alignment: Alignment.center,
                        iconDisabledColor: AppColors.white,
                        iconEnabledColor: AppColors.white,
                        value: selectedvalue,
                        hint: Text(
                          'Change Status',
                          style: apptextstyle(
                              color: AppColors.white,
                              size: 12,
                              family: 'Kalliyath1',
                              weight: FontWeight.w600),
                        ),
                        onChanged: (String? newValue) {
                          selectedvalue = newValue!;
                          CollectionReference firedata =
                              FirebaseFirestore.instance.collection('signup');

                          userupdate.add(UserBuilderEvent());
                          firedata.doc(details.id).update({
                            'status': selectedvalue == 'Blocked' ? true : false
                          });
                        },
                        items: <String>['Active', 'Blocked']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: apptextstyle(
                                color: value == 'Active'
                                    ? AppColors.lightgreen
                                    : AppColors.red,
                                size: 15,
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
          ],
        ),
      );
    },
  );
}
