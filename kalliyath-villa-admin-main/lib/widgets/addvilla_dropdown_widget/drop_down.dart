import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/add_villa/bloc/addvilla_bloc.dart';

Widget selectVillatype() {
  AddvillaBloc bloc = AddvillaBloc();
  String selectedVilla = '';
  return BlocBuilder<AddvillaBloc, AddvillaState>(
    bloc: bloc,
    builder: (context, state) {
      if (state is Dropdownbuilderstate) {
        return SizedBox(
          child: SizedBox(
            width: 200,
            child: DropdownButton<String>(
              value: selectedVilla,
              hint: const Text('Select a Villa'),
              onChanged: (String? newValue) {
                selectedVilla = newValue!;
                bloc.add(Dropdownbuilder());
              },
              items: <String>[
                'Beachfront Villa',
                'Cliffside Villa',
                'Mountain Villa',
                'Lakefront Villa',
                'Island Villa'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      }
      return SizedBox(
        width: 20,
        height: 10,
        child: DropdownButton<String>(
          value: selectedVilla,
          hint: const Text('Select a Villa'),
          onChanged: (String? newValue) {
            selectedVilla = newValue!;
            bloc.add(Dropdownbuilder());
          },
          items: <String>[
            'Beachfront Villa',
            'Cliffside Villa',
            'Mountain Villa',
            'Lakefront Villa',
            'Island Villa'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: SizedBox(
                width: double.infinity,
                child: Text(value),
              ),
            );
          }).toList(),
        ),
      );
    },
  );
}
