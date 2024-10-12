import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/login_page/bloc/login_bloc.dart';
import 'package:kalliyath_villa_admin/main_page/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

login(
    context, formkey, usercontroller, passwordcontoller, LoginBloc bloc) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (formkey.currentState!.validate()) {
    bloc.add(LoadingEvent());
    if (usercontroller == 'admin' && passwordcontoller == '1234') {
      await prefs.setBool('admin', true);
      await Future.delayed(const Duration(seconds: 2));
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const MainPage()));
    }
  }
}

bool isloged = false;
usedlogedchecking() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? istrue = prefs.getBool('admin');
  if (istrue != null) {
    isloged = true;
  } else {
    isloged = false;
  }
}
