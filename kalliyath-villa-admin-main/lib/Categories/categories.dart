import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/Categories/categories_tile.dart';
import 'package:kalliyath_villa_admin/main_page/bloc/main_page_bloc.dart';

class Categoriespage extends StatelessWidget {
  Categoriespage({super.key});
  final CollectionReference categories =
      FirebaseFirestore.instance.collection('Categories');
  final MainPageBloc categoryloading = MainPageBloc();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: categoriesTile(
            size: size, context: context, categories: categories));
  }
}
