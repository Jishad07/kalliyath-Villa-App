import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/Categories/add_update_categories/add_update_categories.dart';
import 'package:kalliyath_villa_admin/Categories/delete_category/delete_category.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/firebase/firebase_get.dart';
import 'package:kalliyath_villa_admin/main_page/bloc/main_page_bloc.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

categoriesTile(
    {required Size size, required BuildContext context, required categories}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Material(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(10),
              color: AppColors.blueweb,
              child: InkWell(
                  splashColor: const Color.fromARGB(52, 97, 93, 93),
                  onTap: () {
                    addcategories(size: size, context: context, istrue: false);
                  },
                  child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      height: size.height / 15,
                      width: size.width / 10,
                      child: Center(
                          child: Text(
                        'Add Categories',
                        style: apptextstyle(
                            color: AppColors.white,
                            size: 15,
                            weight: FontWeight.w500),
                      )))),
            )
          ],
        ),
      ),
      Expanded(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: BlocBuilder<MainPageBloc, MainPageState>(
              bloc: blocCategories,
              builder: (context, state) {
                if (state is LoadingCircularState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.black,
                    ),
                  );
                } else if (state is CategoriesBuildState) {
                  return villaCategories.isEmpty
                      ? Center(
                          child: Text(
                            'No Categories',
                            style: apptextstyle(
                                color: AppColors.black,
                                size: 17,
                                weight: FontWeight.w500),
                          ),
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 4.5,
                            crossAxisCount: 4,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: villaCategories.length,
                          itemBuilder: (BuildContext context, int index) {
                            final category = villaCategories[index]['category'];
                            final id = villaCategories[index]['id'];
                            return Container(
                                decoration: BoxDecoration(
                                  border: const Border.fromBorderSide(
                                      BorderSide(color: Colors.black)),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, right: 5),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          category,
                                          style: apptextstyle(
                                              color: AppColors.black,
                                              size: 15,
                                              weight: FontWeight.w500),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          addcategories(
                                            size: size,
                                            context: context,
                                            istrue: true,
                                            text: category,
                                            id: id,
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color:
                                              Color.fromARGB(255, 58, 58, 57),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          deleteCategory(
                                              context,
                                              id,
                                              categories,
                                              size,
                                              blocCategories,
                                              category,
                                              false);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: AppColors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          },
                        );
                }
                return Center(
                  child: Text(
                    'No Categories',
                    style: apptextstyle(
                        color: AppColors.black,
                        size: 15,
                        weight: FontWeight.w500),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ],
  );
}
