import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';

import 'package:kalliyath_villa_admin/model/message.dart';
import 'package:kalliyath_villa_admin/model/user.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

messageWidget(
    {required bool istrue,
    required Size size,
    required Message message,
    required UserModel user}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Column(
      crossAxisAlignment:
          istrue == true ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: istrue == true
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          mainAxisAlignment:
              istrue ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            if (istrue == true)
              Padding(
                padding: const EdgeInsets.only(right: 7, bottom: 10),
                child: CircleAvatar(
                  radius: size.width / 90,
                  backgroundImage: NetworkImage(user.image),
                ),
              ),
            Padding(
              padding: EdgeInsets.only(
                  left: istrue == true ? 5 : 0,
                  top: 10,
                  bottom: 10,
                  right: istrue == true ? 10 : 5),
              child: Container(
                  constraints:
                      BoxConstraints(minWidth: 0, maxWidth: size.width / 4),
                  decoration: BoxDecoration(
                      color: istrue == false
                          ? const Color.fromARGB(255, 215, 216, 216)
                          : const Color.fromARGB(255, 81, 164, 222),
                      borderRadius: BorderRadius.only(
                          bottomLeft: const Radius.circular(10),
                          bottomRight: Radius.circular(istrue == true ? 10 : 0),
                          topLeft: Radius.circular(istrue == false ? 10 : 0),
                          topRight: const Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: istrue == true
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 5, left: 15, right: 15),
                        child: Text(
                          message.content,
                          maxLines: 100,
                          overflow: TextOverflow.ellipsis,
                          style: apptextstyle(
                              color: istrue != true
                                  ? AppColors.black
                                  : AppColors.white,
                              size: 14,
                              family: 'Kalliyath1'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, bottom: 5, right: 3),
                        child: SizedBox(
                          width: size.width / 23,
                          child: Row(
                            mainAxisAlignment: istrue != true
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat('h:mm a').format(message.sentTime),
                                maxLines: 10,
                                overflow: TextOverflow.ellipsis,
                                style: apptextstyle(
                                    color: istrue != true
                                        ? AppColors.black
                                        : AppColors.white,
                                    size: 10,
                                    family: 'Kalliyath1'),
                              ),
                              if (istrue != true)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 3, right: 3),
                                  child: Icon(
                                    Icons.done,
                                    size: 13,
                                    color: istrue != true
                                        ? AppColors.black
                                        : AppColors.white,
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            if (istrue != true)
              Padding(
                padding: const EdgeInsets.only(left: 7, top: 10),
                child: CircleAvatar(
                  radius: size.width / 90,
                  backgroundColor: AppColors.black,
                  child: Center(
                    child: Text(
                      'A',
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: apptextstyle(
                          color: AppColors.white,
                          size: 20,
                          weight: FontWeight.normal,
                          family: 'Kalliyath1'),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    ),
  );
}
