import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/model/message.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/firebase/chat_api.dart';
import 'package:kalliyath_villa_admin/messages/bloc/message_bloc.dart';
import 'package:kalliyath_villa_admin/messages/messages.dart';
import 'package:kalliyath_villa_admin/model/user.dart';
import 'package:kalliyath_villa_admin/style/textstyle.dart';

UserModel? userone;
usersLitsTile({required Size size}) {
  return SizedBox(
      height: size.height,
      width: size.width / 4.8,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ], color: AppColors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15),
                child: Text(
                  'Users',
                  style: apptextstyle(
                      color: AppColors.black,
                      size: 20,
                      weight: FontWeight.w400),
                ),
              ),
              Expanded(
                child: StreamBuilder<List<UserModel>>(
                  stream: ChatController().getUsers(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      List<UserModel> users = snapshot.data ?? [];

                      return ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (ctx, index) {
                          UserModel user = users[index];

                          return ListTile(
                              onTap: () {
                                userone = user;
                                messagebox.add(MessageBoxRebuild());
                              },
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(user.image),
                              ),
                              title: Text(
                                user.name,
                                style: apptextstyle(
                                    color: AppColors.black, size: 15),
                              ),
                              subtitle: Text(
                                'Last Active :${timeago.format(user.lastActive)}',
                                style: apptextstyle(
                                    color: AppColors.black, size: 11),
                              ),
                              trailing: StreamBuilder<List<Message>>(
                                  stream: ChatController().getMessages(user.id),
                                  builder: (context, snapshot) {
                                    List<Message> messages =
                                        snapshot.data ?? [];
                                    int unreadMessageCount = messages
                                        .where((message) => !message.read)
                                        .length;

                                    return unreadMessageCount == 0
                                        ? const SizedBox()
                                        : CircleAvatar(
                                            radius: 9,
                                            backgroundColor:
                                                AppColors.lightgreen,
                                            child: Center(
                                              child: Text(
                                                '$unreadMessageCount',
                                                style: apptextstyle(
                                                  color: AppColors.white,
                                                  size: 10,
                                                ),
                                              ),
                                            ),
                                          );
                                  }));
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ));
}
