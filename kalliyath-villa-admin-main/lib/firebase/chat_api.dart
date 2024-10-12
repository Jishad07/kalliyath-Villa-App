import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kalliyath_villa_admin/model/message.dart';

import 'package:kalliyath_villa_admin/model/user.dart';

class ChatController {
  // static Future<void> updateUserData(Map<String, dynamic> data, userid) async {
  //   try {
  //     final collectionReference = FirebaseFirestore.instance
  //         .collection('signup')
  //         .doc('admin1234')
  //         .collection('chat')
  //         .doc(userid)
  //         .collection('messages');

  //     final messages = await collectionReference.get();

  //     for (final message in messages.docs) {
  //       collectionReference.doc(message.id).update(data);
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  static Future<void> updateUserDatasingle(
      Map<String, dynamic> data, String userid) async {
    try {
      final QuerySnapshot messagesSnapshot = await FirebaseFirestore.instance
          .collection('signup')
          .doc('admin1234')
          .collection('chat')
          .doc(userid)
          .collection('messages')
          .get();

      WriteBatch batch = FirebaseFirestore.instance.batch();

      messagesSnapshot.docs.forEach((doc) {
        batch.update(doc.reference, data);
      });

      await batch.commit();
    } catch (e) {
      log(e.toString());
    }
  }

  Stream<List<UserModel>> getUsers() async* {
    try {
      final messagesSnapshot = FirebaseFirestore.instance
          .collection('signup')
          .orderBy('lastActive', descending: true)
          .snapshots(includeMetadataChanges: true);

      await for (final messages in messagesSnapshot) {
        final messagesList = messages.docs
            .map((e) => UserModel.fromJson(e.id, e.data()))
            .toList();

        yield messagesList;
      }
    } catch (e) {
      log('Error fetching messages: $e');
      yield [];
    }
  }

  Stream<UserModel> getUserStatus(String userId) async* {
    try {
      final messagesSnapshot = FirebaseFirestore.instance
          .collection('signup')
          .doc(userId)
          .snapshots(includeMetadataChanges: true);

      final messagesList = messagesSnapshot
          .map((snapshot) => UserModel.fromJson(snapshot.id, snapshot.data()!));

      await for (var user in messagesList) {
        yield user;
      }
    } catch (e) {
      log('Error fetching user data: $e');
    }
  }

  Stream<List<Message>> getMessages(String receiverId) async* {
    try {
      final messagesSnapshot = FirebaseFirestore.instance
          .collection('signup')
          .doc('admin1234')
          .collection('chat')
          .doc(receiverId)
          .collection('messages')
          .orderBy('sentTime', descending: false)
          .snapshots(includeMetadataChanges: true);

      await for (final messages in messagesSnapshot) {
        final messagesList =
            messages.docs.map((e) => Message.fromJson(e.id, e.data())).toList();

        yield messagesList;
      }
    } catch (e) {
      log('Error fetching messages: $e');
      yield [];
    }
  }
}
