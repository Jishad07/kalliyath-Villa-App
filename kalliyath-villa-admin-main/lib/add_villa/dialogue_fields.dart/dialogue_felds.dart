import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/dialogue_fields.dart/text_field.dart';

class DialogueFields extends StatelessWidget {
  const DialogueFields(
      {super.key,
      required this.size,
      required this.villa,
      required this.formkey,
      required this.edit});
  final GlobalKey formkey;
  final Size size;
  final AddvillaBloc villa;
  final bool edit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormWidget(
              size: size,
              villa: villa,
              formkey: formkey,
              edit: edit,
            )
          ],
        ),
      ),
    );
  }
}
