import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/login_page/bloc/login_bloc.dart';
import 'package:kalliyath_villa_admin/login_page/functions.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

loginTile(
    {required adminkey,
    required TextEditingController usercontroller,
    required TextEditingController passcontroller,
    required Size size}) {
  final FocusNode userFocusNode = FocusNode();
  final FocusNode passFocusNode = FocusNode();
  LoginBloc loginbloc = LoginBloc();
  return Center(
    child: LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;

        double maxWidthFactor = width / 3;
        double maxHeightFactor = height / 1.5;
        if (width < 430) {
          maxWidthFactor = width - 20;
          maxHeightFactor = height / 1.5;
        } else if (width < 600) {
          maxWidthFactor = width - 200;
          maxHeightFactor = height / 1.5;
        } else if (width < 915) {
          maxWidthFactor = width / 1.6;
          maxHeightFactor = height / 1.5;
        } else if (width < 1025) {
          maxWidthFactor = width / 1.7;
          maxHeightFactor = height / 1.5;
        } else if (width < 1290) {
          maxWidthFactor = width / 2.5;
          maxHeightFactor = height / 1.5;
        }
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxHeightFactor,
            maxWidth: maxWidthFactor,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(103, 158, 158, 158),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'KALLIYATH VILLA',
                    style: apptextstyle(
                        color: AppColors.black,
                        size: 25,
                        weight: FontWeight.w600),
                  ),
                ),
                Center(
                  child: Text(
                    'Login',
                    style: apptextstyle(
                      color: AppColors.black,
                      size: 20,
                    ),
                  ),
                ),
                Form(
                  key: adminkey,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          focusNode: userFocusNode,
                          controller: usercontroller,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Username';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.white,
                            prefixIcon: const Icon(Icons.person),
                            labelText: 'Username',
                            labelStyle:
                                const TextStyle(fontFamily: "Kalliyath"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height / 30,
                        ),
                        TextFormField(
                          focusNode: passFocusNode,
                          controller: passcontroller,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Password';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.white,
                            prefixIcon: const Icon(Icons.lock_outline),
                            labelText: 'Password',
                            labelStyle:
                                const TextStyle(fontFamily: "Kalliyath"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Demo Admin',
                                style: apptextstyle(
                                  color: AppColors.black,
                                  size: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: SelectableText(
                                  'Username: admin',
                                  style: apptextstyle(
                                    color: AppColors.black,
                                    size: 12,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: SelectableText(
                                  'Password: 1234',
                                  style: apptextstyle(
                                    color: AppColors.black,
                                    size: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height / 30,
                        ),
                        BlocBuilder<LoginBloc, LoginState>(
                          bloc: loginbloc,
                          builder: (context, state) {
                            bool loading = false;
                            if (state is LoadingEventstate) {
                              loading = state.istrue;
                            }
                            return Material(
                              clipBehavior: Clip.hardEdge,
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor:
                                    const Color.fromARGB(121, 129, 128, 128),
                                onTap: () {
                                  login(
                                      context,
                                      adminkey,
                                      usercontroller.text.trim(),
                                      passcontroller.text.trim(),
                                      loginbloc);
                                },
                                child: Container(
                                  height: size.height / 15,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightgreen,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: loading
                                        ? const CircularProgressIndicator(
                                            color: AppColors.white,
                                          )
                                        : Text(
                                            'Login',
                                            style: apptextstyle(
                                                color: AppColors.white,
                                                size: 17,
                                                weight: FontWeight.w400),
                                          ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
