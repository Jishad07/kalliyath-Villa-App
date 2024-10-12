import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/onclick_function/controller.dart';
import 'package:kalliyath_villa_admin/widgets/checkbox_widget/checkbox_widget.dart';

checkBox({Map<String, dynamic>? details}) {
  AddvillaBloc blc = AddvillaBloc();
  AddvillaBloc blc1 = AddvillaBloc();
  AddvillaBloc blc2 = AddvillaBloc();
  AddvillaBloc blc3 = AddvillaBloc();
  AddvillaBloc blc4 = AddvillaBloc();
  AddvillaBloc blc5 = AddvillaBloc();
  AddvillaBloc blc6 = AddvillaBloc();
  blc.add(
      AdvillaInitial(istrue: details!.isNotEmpty ? details['wifi'] : false));
  blc1.add(
      AdvillaInitial(istrue: details.isNotEmpty ? details['parking'] : false));
  blc2.add(AdvillaInitial(istrue: details.isNotEmpty ? details['tv'] : false));
  blc3.add(AdvillaInitial(
      istrue: details.isNotEmpty ? details['swimmingpool'] : false));
  blc4.add(AdvillaInitial(
      istrue: details.isNotEmpty ? details['playground'] : false));
  blc5.add(AdvillaInitial(istrue: details.isNotEmpty ? details['spa'] : false));
  blc6.add(
      AdvillaInitial(istrue: details.isNotEmpty ? details['fitness'] : false));
  return Expanded(
    child: ListView(
      children: [
        BlocBuilder<AddvillaBloc, AddvillaState>(
          bloc: blc,
          builder: (context, state) {
            bool istrue = false;
            if (state is AcCheckboxcCickedstate) {
              istrue = state.istrue;
            } else if (state is AcCheckboxcCickstate) {
              istrue = state.istrue;
            }
            return CheckBoxWidget(
                istrue: istrue,
                ontap: (bool value) {
                  wifi = value;
                  blc.add(AcCheckboxcCick(istrue: istrue));
                },
                text: 'Wifi');
          },
        ),
        BlocBuilder<AddvillaBloc, AddvillaState>(
          bloc: blc1,
          builder: (context, state) {
            bool istrue = false;
            if (state is AcCheckboxcCickedstate) {
              istrue = state.istrue;
            } else if (state is AcCheckboxcCickstate) {
              istrue = state.istrue;
            }
            return CheckBoxWidget(
                istrue: istrue,
                ontap: (bool value) {
                  parking = value;
                  blc1.add(AcCheckboxcCick(istrue: istrue));
                },
                text: 'Parking');
          },
        ),
        BlocBuilder<AddvillaBloc, AddvillaState>(
          bloc: blc2,
          builder: (context, state) {
            bool istrue = false;
            if (state is AcCheckboxcCickedstate) {
              istrue = state.istrue;
            } else if (state is AcCheckboxcCickstate) {
              istrue = state.istrue;
            }
            return CheckBoxWidget(
                istrue: istrue,
                ontap: (bool value) {
                  tv = value;
                  blc2.add(AcCheckboxcCick(istrue: istrue));
                },
                text: 'Tv');
          },
        ),
        BlocBuilder<AddvillaBloc, AddvillaState>(
          bloc: blc3,
          builder: (context, state) {
            bool istrue = false;
            if (state is AcCheckboxcCickedstate) {
              istrue = state.istrue;
            } else if (state is AcCheckboxcCickstate) {
              istrue = state.istrue;
            }
            return CheckBoxWidget(
                istrue: istrue,
                ontap: (bool value) {
                  swimmingpool = value;
                  blc3.add(AcCheckboxcCick(istrue: istrue));
                },
                text: 'Swimming Pool');
          },
        ),
        BlocBuilder<AddvillaBloc, AddvillaState>(
          bloc: blc4,
          builder: (context, state) {
            bool istrue = false;
            if (state is AcCheckboxcCickedstate) {
              istrue = state.istrue;
            } else if (state is AcCheckboxcCickstate) {
              istrue = state.istrue;
            }
            return CheckBoxWidget(
                istrue: istrue,
                ontap: (bool value) {
                  playground = value;
                  blc4.add(AcCheckboxcCick(istrue: istrue));
                },
                text: 'Play Ground');
          },
        ),
        BlocBuilder<AddvillaBloc, AddvillaState>(
          bloc: blc5,
          builder: (context, state) {
            bool istrue = false;
            if (state is AcCheckboxcCickedstate) {
              istrue = state.istrue;
            } else if (state is AcCheckboxcCickstate) {
              istrue = state.istrue;
            }
            return CheckBoxWidget(
                istrue: istrue,
                ontap: (bool value) {
                  spa = value;
                  blc5.add(AcCheckboxcCick(istrue: istrue));
                },
                text: 'Spa fecilities');
          },
        ),
        BlocBuilder<AddvillaBloc, AddvillaState>(
          bloc: blc6,
          builder: (context, state) {
            bool istrue = false;
            if (state is AcCheckboxcCickedstate) {
              istrue = state.istrue;
            } else if (state is AcCheckboxcCickstate) {
              istrue = state.istrue;
            }
            return CheckBoxWidget(
                istrue: istrue,
                ontap: (bool value) {
                  fitness = value;
                  blc6.add(AcCheckboxcCick(istrue: istrue));
                },
                text: 'Fitness Center');
          },
        ),
      ],
    ),
  );
}
