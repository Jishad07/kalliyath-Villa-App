import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';
import 'package:kalliyath_villa_admin/villas/details/facilities_tile.dart';

detailsTile(
    {required Size size,
    required Map<String, dynamic> details,
    required AddvillaBloc bloc,
    required place}) {
  return SingleChildScrollView(
    child: Container(
      color: Colors.white,
      height: size.height,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
            color: AppColors.blueweb,
            borderRadius: BorderRadius.circular(50),
          ),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 45, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      details['name'],
                      style: apptextstyle(
                        color: AppColors.white,
                        size: 30,
                      ),
                    ),
                    Container(
                      width: size.width / 20,
                      height: size.height / 20,
                      decoration: BoxDecoration(
                          color: details['status'] == false
                              ? AppColors.lightgreen
                              : AppColors.red,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          details['status'] == false ? "Active" : "Blocked",
                          style: apptextstyle(
                            color: AppColors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: size.width,
                height: size.height / 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 42, top: 20),
                  child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 20,
                          ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (ctx, index) {
                        final image =
                            details['images'].reversed.toList()[index];

                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          width: size.width / 4.7,
                          height: size.height / 35,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: BlocBuilder<AddvillaBloc, AddvillaState>(
                                bloc: bloc,
                                builder: (context, state) {
                                  if (state is VilladetailsimageloderState) {
                                    return Center(
                                      child: SizedBox(
                                        height: size.height / 15,
                                        width: size.width / 30,
                                        child: const CircularProgressIndicator(
                                            color: AppColors.white),
                                      ),
                                    );
                                  } else if (state
                                      is VilladetailsimageloderSuccessState) {
                                    return Image.network(
                                      fit: BoxFit.cover,
                                      image,
                                      filterQuality: FilterQuality.high,
                                    );
                                  }
                                  return Container();
                                },
                              )),
                        );
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 42, top: 40, right: 40),
                child: Text(
                  details['description'],
                  style: apptextstyle(
                    color: AppColors.white,
                    size: 17,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 42, top: 10, right: 40),
                child: Text(
                  ' ₹ ${details['price']} (Per day)',
                  style: apptextstyle(
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 42, top: 10, right: 40),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Color.fromARGB(255, 255, 183, 0),
                        ),
                        Text(
                          '  Location : $place,${details['locationadress']['state_district']},${details['locationadress']['state']}',
                          style: apptextstyle(
                            color: AppColors.white,
                            size: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 42, top: 10, right: 40),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.villa_sharp,
                          color: AppColors.lightgreen,
                        ),
                        Text(
                          '  Type : ${details['type']}',
                          style: apptextstyle(
                            color: AppColors.white,
                            size: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 42, top: 10, right: 40),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.meeting_room_rounded,
                          color: Color.fromARGB(255, 242, 255, 0),
                        ),
                        Text(
                          '  Bhk : ${details['bhk']}',
                          style: apptextstyle(
                            color: AppColors.white,
                            size: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 42, top: 10, right: 40),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 255, 162, 0),
                        ),
                        Text(
                          '  Per head : ${details['perperson']}',
                          style: apptextstyle(
                            color: AppColors.white,
                            size: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              facilitiesTile(size: size, details: details)
            ],
          ),
        ),
      ),
    ),
  );
}
