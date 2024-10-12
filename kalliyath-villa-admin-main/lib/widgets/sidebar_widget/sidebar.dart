import 'package:adaptive_navigation_widget/adaptive_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/main_page/bloc/main_page_bloc.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

MainPageBloc sidebarindex = MainPageBloc();
Widget sidebar({
  required height,
  required width,
  required Widget icon,
  required Widget icon2,
  required Function ontap,
  required bool istrue,
  required name,
}) {
  return SizedBox(
    height: height,
    width: width,
    child: Padding(
        padding: const EdgeInsets.all(10),
        child: Material(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          child: InkWell(
              splashColor: const Color.fromARGB(121, 0, 0, 0),
              onTap: () {
                ontap();
              },
              child: istrue
                  ? Container(
                      decoration: BoxDecoration(
                          color: AppColors.blueweb,
                          borderRadius: BorderRadius.circular(8)),
                      height: height / 15,
                      width: width / 8,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Center(
                          child: ListTile(
                            leading: icon2,
                            title: Text(name,
                                style: apptextstyle(
                                  color: AppColors.white,
                                  size: 16,
                                )),
                          ),
                        ),
                      ))
                  : Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      height: height / 15,
                      width: width / 8,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Center(
                          child: ListTile(
                            leading: icon,
                            title: Text(name,
                                style: apptextstyle(
                                  color: AppColors.black,
                                  size: 16,
                                )),
                          ),
                        ),
                      ))),
        )),
  );
}

final List<AdaptiveDestination> destinations = [
  const AdaptiveDestination(
    initialPath: "/home",
    icon: Icon(
      Icons.home_outlined,
      color: AppColors.black, size: 20
    ),
    selectedIcon: Icon(Icons.home, color: AppColors.white, size: 20),
    label: "Dashboard",
    tooltip: "Dashboard",
  ),
  const AdaptiveDestination(
    initialPath: "/feed",
    icon: Icon(Icons.villa_outlined, color: AppColors.black, size: 20),
    selectedIcon: Icon(Icons.villa, color: AppColors.white, size: 20),
    label: "Villas",
    tooltip: "Villas",
  ),
  const AdaptiveDestination(
    initialPath: "/booking",
    icon: Icon(Icons.luggage_outlined, color: AppColors.black, size: 20),
    selectedIcon: Icon(Icons.luggage_rounded, color: AppColors.white, size: 20),
    label: 'booking',
  ),
  const AdaptiveDestination(
    initialPath: "/profile",
    icon: Icon(Icons.person_outlined, color: AppColors.black, size: 20),
    selectedIcon: Icon(Icons.person, color: AppColors.white, size: 20),
    label: "User",
    tooltip: "User",
  ),
  const AdaptiveDestination(
    initialPath: "/Revenue",
    icon: Icon(Icons.currency_rupee_outlined, color: AppColors.black, size: 20),
    selectedIcon: Icon(Icons.currency_rupee, color: AppColors.white, size: 20),
    label: 'Revenue',
    tooltip: 'Revenue',
  ),
  const AdaptiveDestination(
    initialPath: "/Categories",
    icon: Icon(Icons.holiday_village_outlined, color: AppColors.black, size: 20),
    selectedIcon: Icon(Icons.holiday_village, color: AppColors.white, size: 20),
    label: 'Categories',
    tooltip: 'Categories',
  ),
  const AdaptiveDestination(
    initialPath: "/Messages",
    icon: Icon(
      Icons.message_outlined,
      color: AppColors.black,
      size: 20,
    ),
    selectedIcon: Icon(Icons.message, color: AppColors.white, size: 20),
    label: 'Messages',
    tooltip: 'Messages',
  ),
];
