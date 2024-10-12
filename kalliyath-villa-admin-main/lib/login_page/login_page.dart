import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/login_page/login_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController usercontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final GlobalKey<FormState> adminkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: loginTile(
            adminkey: adminkey,
            usercontroller: usercontroller,
            passcontroller: passcontroller,
            size: size));
  }
}
