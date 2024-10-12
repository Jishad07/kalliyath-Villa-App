import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/add_villa/add_villa.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

class TableItems extends StatelessWidget {
  const TableItems({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 13),
              child: Text(
                'Villas',
                style: apptextstyle(
                  color: AppColors.black,
                  size: 25,
                ),
              ),
            ),
            Material(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              child: InkWell(
                splashColor: const Color.fromARGB(121, 129, 128, 128),
                onTap: () {
                  addvilla(context, size, {}, false);
                },
                child: Container(
                  height: size.height / 15,
                  width: size.width / 10,
                  decoration: BoxDecoration(
                    color: AppColors.blueweb,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Add Villa',
                      style: apptextstyle(
                          color: AppColors.white,
                          size: 15,
                          weight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height / 50,
        ),
        Container(
          height: size.height / 10,
          width: size.width / 1.2,
          decoration: BoxDecoration(
              color: AppColors.blueweb,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 52, right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: size.height / 15,
                        width: size.width / 25,
                        child: Center(
                          child: Text(
                            'Image',
                            style: apptextstyle(
                              color: AppColors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 15,
                        width: size.width / 20,
                        child: Center(
                          child: Text('Name',
                              style: apptextstyle(
                                color: AppColors.white,
                                size: 16,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 15,
                        width: size.width / 9,
                        child: Center(
                          child: Text(
                            'Type',
                            style: apptextstyle(
                              color: AppColors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: SizedBox(
                          height: size.height / 15,
                          width: size.width / 40,
                          child: Center(
                            child: Text(
                              'Price',
                              style: apptextstyle(
                                color: AppColors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: SizedBox(
                          height: size.height / 20,
                          width: size.width / 20,
                          child: Center(
                            child: Text(
                              'Details',
                              style: apptextstyle(
                                color: AppColors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 15,
                        width: size.width / 12,
                        child: Center(
                          child: Text('Status',
                              style: apptextstyle(
                                color: AppColors.white,
                                size: 16,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 20,
                        width: size.width / 20,
                        child: Center(
                          child: Text(
                            'Edit',
                            style: apptextstyle(
                              color: AppColors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 20,
                        width: size.width / 20,
                        child: Center(
                          child: Text('Delete',
                              style: apptextstyle(
                                color: AppColors.white,
                                size: 16,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
