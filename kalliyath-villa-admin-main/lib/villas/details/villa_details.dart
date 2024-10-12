import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';
import 'package:kalliyath_villa_admin/villas/details/details_tile.dart';

class VillaDetails extends StatefulWidget {
  const VillaDetails({super.key, required this.details});

  final Map<String, dynamic> details;

  @override
  State<VillaDetails> createState() => _VillaDetailsState();
}

class _VillaDetailsState extends State<VillaDetails> {
  @override
  void initState() {
    bloc.add(Villadetailsimageloder(istrue: false));
    if (widget.details['locationadress']['suburb'] != null) {
      place = widget.details['locationadress']['suburb'];
      return;
    } else {
      place = widget.details['locationadress']['county'];
    }

    super.initState();
  }

  late String place;
  AddvillaBloc bloc = AddvillaBloc();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppColors.blueweb,
          title: Text(
            'Villa Details',
            style: apptextstyle(
              color: AppColors.white,
              size: 20,
            ),
          ),
        ),
        body: detailsTile(
            size: size, details: widget.details, bloc: bloc, place: place));
  }
}
