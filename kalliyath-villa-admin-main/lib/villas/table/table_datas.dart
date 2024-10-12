import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/add_villa.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/firebase/firebase_get.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';
import 'package:kalliyath_villa_admin/villas/details/villa_details.dart';
import 'package:kalliyath_villa_admin/villas/table/functions.dart';

final AddvillaBloc detailsbloc = AddvillaBloc();
final AddvillaBloc detailsimage = AddvillaBloc();

class TableDatas extends StatelessWidget {
  TableDatas({super.key, required this.size});
  final Size size;

  String selectedvalue = 'Active';

  final AddvillaBloc statusbloc = AddvillaBloc();

  final CollectionReference firebaseCollection =
      FirebaseFirestore.instance.collection('VillaDetails');

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ], color: AppColors.white, borderRadius: BorderRadius.circular(10)),
          child: BlocBuilder<AddvillaBloc, AddvillaState>(
            bloc: detailsbloc,
            builder: (context, state) {
              if (state is DetailsloadingState) {
                return Container(
                    color: const Color.fromARGB(35, 145, 143, 143),
                    height: double.infinity,
                    width: double.infinity,
                    child: const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.blueweb)));
              } else if (state is DetailsbuilderState) {
                return villaDetails.isEmpty
                    ? Center(
                        child: Text(
                          'No datas',
                          style: apptextstyle(
                            color: AppColors.black,
                            size: 16,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: villaDetails.length,
                        itemBuilder: (ctx, index) {
                          final details = villaDetails[index];
                          final image = details['images'] as List;
                          selectedvalue =
                              details['status'] == false ? 'Active' : 'Blocked';
                          List name = details['name'].split('').toList();
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 52, right: 50),
                            child: SizedBox(
                              height: size.height / 10,
                              width: size.width / 1.2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  BlocBuilder<AddvillaBloc, AddvillaState>(
                                    bloc: detailsimage,
                                    builder: (context, state) {
                                      if (state
                                          is VilladetailsimageloderState) {
                                        return Center(
                                          child: SizedBox(
                                            height: size.height / 20,
                                            width: size.width / 40,
                                            child:
                                                const CircularProgressIndicator(
                                              color: AppColors.black,
                                            ),
                                          ),
                                        );
                                      } else if (state
                                          is VilladetailsimageloderSuccessState) {
                                        return Container(
                                          height: size.height / 15,
                                          width: size.width / 25,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image:
                                                      NetworkImage(image[0])),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        );
                                      }
                                      return Container();
                                    },
                                  ),
                                  name.length > 13
                                      ? SizedBox(
                                          height: size.height / 15,
                                          width: size.width / 12,
                                          child: Text(
                                            details['name'],
                                            style: apptextstyle(
                                              color: AppColors.black,
                                              size: 16,
                                            ),
                                          ),
                                        )
                                      : SizedBox(
                                          height: size.height / 15,
                                          width: size.width / 12,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 13),
                                            child: Text(
                                              details['name'],
                                              style: apptextstyle(
                                                color: AppColors.black,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                  SizedBox(
                                    height: size.height / 15,
                                    width: size.width / 12,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text(
                                        details['type'],
                                        style: apptextstyle(
                                          color: AppColors.black,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height / 15,
                                    width: size.width / 15,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text(
                                        '${details['price']}/Day',
                                        style: apptextstyle(
                                          color: AppColors.black,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (ctx) => VillaDetails(
                                                    details: details,
                                                  )));
                                    },
                                    child: Container(
                                      height: size.height / 20,
                                      width: size.width / 20,
                                      decoration: BoxDecoration(
                                          color: AppColors.lightgreen,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Center(
                                        child: Text(
                                          'Details',
                                          style: TextStyle(
                                              color: AppColors.white,
                                              fontFamily: "Kalliyath"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  BlocBuilder<AddvillaBloc, AddvillaState>(
                                    bloc: statusbloc,
                                    builder: (context, state) {
                                      return SizedBox(
                                        height: size.height / 15,
                                        width: size.width / 12,
                                        child: DropdownButton<String>(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          autofocus: false,
                                          underline: Container(),
                                          alignment: Alignment.center,
                                          value: selectedvalue,
                                          hint: Text(
                                            'Change Status',
                                            style: apptextstyle(
                                              color: AppColors.black,
                                              size: 15,
                                            ),
                                          ),
                                          onChanged: (String? newValue) {
                                            selectedvalue = newValue!;
                                            firebaseCollection
                                                .doc(details['id'])
                                                .update({
                                              'status':
                                                  selectedvalue == 'Active'
                                                      ? false
                                                      : true
                                            });
                                            statusbloc.add(Statusbuilder());
                                            detailsbloc.add(
                                                Detailsbuilder(istrue: true));
                                          },
                                          items: <String>['Active', 'Blocked']
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
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
                                      );
                                    },
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      addvilla(context, size, details, true);
                                    },
                                    child: Container(
                                      height: size.height / 20,
                                      width: size.width / 20,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 0, 102, 255),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Center(
                                        child: Text(
                                          'Edit',
                                          style: TextStyle(
                                              color: AppColors.white,
                                              fontFamily: "Kalliyath"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      aletdilagueDelete(
                                          context: context,
                                          size: size,
                                          firebase: firebaseCollection,
                                          details: details);
                                    },
                                    child: Container(
                                      height: size.height / 20,
                                      width: size.width / 20,
                                      decoration: BoxDecoration(
                                          color: AppColors.red,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Center(
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                              color: AppColors.white,
                                              fontFamily: "Kalliyath"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
