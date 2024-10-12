import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/firebase/chat_api.dart';
import 'package:kalliyath_villa_admin/messages/functions.dart';
import 'package:kalliyath_villa_admin/messages/message_widget/message_widget.dart';
import 'package:kalliyath_villa_admin/model/message.dart';
import 'package:kalliyath_villa_admin/model/user.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:kalliyath_villa_admin/style/textstyle.dart';

Widget usermessageTile({
  required Size size,
  UserModel? user,
}) {
  final TextEditingController messagecontroller = TextEditingController();
  ScrollController scrollController = ScrollController();

  return Expanded(
    flex: 6,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: user == null
            ? Center(
                child: Text(
                  'Select a user to chat',
                  style: apptextstyle(color: AppColors.black, size: 17),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.blueweb,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    height: size.height / 13,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(user.image),
                          ),
                          title: Text(
                            user.name,
                            style: apptextstyle(
                              color: AppColors.white,
                              size: 16,
                              weight: FontWeight.w400,
                            ),
                          ),
                          subtitle: StreamBuilder<UserModel>(
                              stream: ChatController().getUserStatus(user.id),
                              builder: (context, snapshot) {
                                UserModel userdata = snapshot.data ??
                                    UserModel(
                                        phonenumber: '',
                                        name: '',
                                        image: '',
                                        lastActive: DateTime.now(),
                                        id: '',
                                        email: '');
                                return userdata.isOnline == true
                                    ? Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 2, right: 3),
                                            child: CircleAvatar(
                                                radius: size.width / 400,
                                                backgroundColor:
                                                    AppColors.lightgreen),
                                          ),
                                          Text(
                                            'Online',
                                            style: apptextstyle(
                                                color: AppColors.white,
                                                size: size.width / 160,
                                                weight: FontWeight.normal,
                                                family: 'Kalliyath2'),
                                          )
                                        ],
                                      )
                                    : Text(
                                        'Last Active :${timeago.format(user.lastActive)}',
                                        style: apptextstyle(
                                            color: AppColors.white,
                                            size: size.width / 160,
                                            weight: FontWeight.normal,
                                            family: 'Kalliyath2'),
                                      );
                              }),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: StreamBuilder<List<Message>>(
                        stream: ChatController().getMessages(user.id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else {
                            List<Message> messages = snapshot.data ?? [];
                            read(user.id, messages);
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              scrollController.animateTo(
                                scrollController.position.maxScrollExtent,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                              );
                            });

                            return messages.isEmpty
                                ? Center(
                                    child: Text(
                                      'No messages',
                                      style: apptextstyle(
                                          color: AppColors.black,
                                          size: 16,
                                          family: 'Kalliyath'),
                                    ),
                                  )
                                : ListView.separated(
                                    controller: scrollController,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (ctx, index) {
                                      final message = messages[index];

                                      final bool side =
                                          message.senderId != 'admin1234'
                                              ? true
                                              : false;
                                      if (index == 0 ||
                                          !isSameDay(message.sentTime,
                                              messages[index - 1].sentTime)) {
                                        return Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              child: Text(
                                                getMessageDate(
                                                    message.sentTime),
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                            messageWidget(
                                              user: user,
                                              istrue: side,
                                              size: size,
                                              message: message,
                                            ),
                                          ],
                                        );
                                      } else {
                                        return messageWidget(
                                          user: user,
                                          istrue: side,
                                          size: size,
                                          message: message,
                                        );
                                      }
                                    },
                                    separatorBuilder: (ctx, index) =>
                                        const SizedBox(height: 5),
                                    itemCount: messages.length,
                                  );
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.blueweb,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              top: 10,
                              bottom: 10,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: TextField(
                                controller: messagecontroller,
                                minLines: 1,
                                maxLines: 3,
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText: "Type your message...",
                                  hintStyle: apptextstyle(
                                    family: 'Kalliyath1',
                                    color: AppColors.black,
                                    size: 14,
                                  ),
                                  hoverColor: Colors.transparent,
                                  fillColor:
                                      const Color.fromARGB(255, 237, 236, 236),
                                  focusColor: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: SizedBox(
                              height: size.height / 15,
                              child: Material(
                                color: const Color.fromARGB(255, 237, 236, 236),
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  onTap: () {
                                    if (messagecontroller.text.isNotEmpty &&
                                        messagecontroller.text.trim() != '') {
                                      sendMessage(
                                          userid: user.id,
                                          content: messagecontroller);
                                    }
                                  },
                                  borderRadius: BorderRadius.circular(20),
                                  child: const Icon(
                                    Icons.send,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    ),
  );
}

read(userid, List<Message> messages) {
  ChatController.updateUserDatasingle({'read': true}, userid);
}
