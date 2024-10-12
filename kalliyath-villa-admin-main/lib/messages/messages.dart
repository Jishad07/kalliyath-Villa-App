import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';
import 'package:kalliyath_villa_admin/messages/bloc/message_bloc.dart';
import 'package:kalliyath_villa_admin/messages/users_list_tile/users_list_tile.dart';
import 'package:kalliyath_villa_admin/messages/users_message_tile/users_message_tile.dart';

MessageBloc messagebox = MessageBloc();

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Row(
        children: [
          usersLitsTile(size: size),
          BlocBuilder<MessageBloc, MessageState>(
            bloc: messagebox,
            builder: (context, state) {

              return usermessageTile(
                size: size,
                user: userone
              );
            },
          )
        ],
      ),
    );
  }
}
