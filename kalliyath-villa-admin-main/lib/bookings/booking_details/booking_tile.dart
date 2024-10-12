import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

bookingDataTile(
    {required Size size, required dynamic details, required bool istrue}) {
  return SizedBox(
    height: size.height,
    width: size.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: size.height / 1.5,
          width: size.width / 1.8,
          decoration: BoxDecoration(
              color: AppColors.blueweb,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height / 1.8,
                      width: size.width / 4.2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                              image: NetworkImage(details['villa']['image'])),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    SizedBox(
                      height: size.height / 1.5,
                      width: size.width / 3.4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (istrue == true)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('CANCELLATION REASON',
                                          style: apptextstyle(
                                              color: AppColors.red,
                                              size: 22,
                                              weight: FontWeight.w900,
                                              family: 'Kalliyath1')),
                                      Text(details['reason'],
                                          style: apptextstyle(
                                              color: AppColors.white,
                                              size: 16,
                                              family: 'Kalliyath1'))
                                    ],
                                  ),
                                SizedBox(
                                  height: size.height / 80,
                                ),
                                Text('VILLA DETAILS',
                                    style: apptextstyle(
                                        color: const Color.fromARGB(
                                            255, 251, 210, 3),
                                        size: 22,
                                        weight: FontWeight.w900,
                                        family: 'Kalliyath1')),
                                Text('Name :   ${details['villa']['name']}',
                                    style: apptextstyle(
                                        color: AppColors.white,
                                        size: 16,
                                        family: 'Kalliyath1')),
                                Text('Place :   ${details['villa']['place']}',
                                    style: apptextstyle(
                                        color: AppColors.white,
                                        size: 16,
                                        family: 'Kalliyath1')),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('PERSONAL DETAILS',
                                    style: apptextstyle(
                                        color: const Color.fromARGB(
                                            255, 251, 210, 3),
                                        size: 22,
                                        weight: FontWeight.w900,
                                        family: 'Kalliyath1')),
                                Text('Name :   ${details['address']['name']} ',
                                    style: apptextstyle(
                                        color: AppColors.white,
                                        size: 16,
                                        family: 'Kalliyath1')),
                                Text(
                                    overflow: TextOverflow.visible,
                                    'Address :   ${details['address']['address']} ',
                                    style: apptextstyle(
                                        color: AppColors.white,
                                        size: 16,
                                        family: 'Kalliyath1')),
                                Text(
                                    'Phone Number :   ${details['address']['phonenumber']} ',
                                    style: apptextstyle(
                                        color: AppColors.white,
                                        size: 16,
                                        family: 'Kalliyath1')),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('AMOUNT',
                                    style: apptextstyle(
                                        color: const Color.fromARGB(
                                            255, 251, 210, 3),
                                        size: 22,
                                        weight: FontWeight.w900,
                                        family: 'Kalliyath1')),
                                Text('Villa :   ₹${details['price']['price']} ',
                                    style: apptextstyle(
                                        color: AppColors.white,
                                        size: 16,
                                        family: 'Kalliyath1')),
                                Text(
                                    'Extra Person :   ₹${details['price']['extraperson']} ',
                                    style: apptextstyle(
                                        color: AppColors.white,
                                        size: 16,
                                        family: 'Kalliyath1')),
                                Text(
                                    'Per night :   ₹${details['price']['pernight']} ',
                                    style: apptextstyle(
                                        color: AppColors.white,
                                        size: 16,
                                        family: 'Kalliyath1')),
                                Text('Taxes :   ₹${details['price']['taxes']} ',
                                    style: apptextstyle(
                                        color: AppColors.white,
                                        size: 16,
                                        family: 'Kalliyath1')),
                                Text('Total :   ₹${details['price']['total']} ',
                                    style: apptextstyle(
                                        color: AppColors.white,
                                        size: 16,
                                        family: 'Kalliyath1')),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
