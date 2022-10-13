import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/data/model/response/call.dart';
import 'package:chat_app/data/model/response/group.dart';
import 'package:chat_app/view/component/widget/show_snackbar.dart';
import 'package:chat_app/view/screen/call/call_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final callRepositoryProvider = Provider(
      (ref) => CallRepository(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
  ),
);

class CallRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  CallRepository({
    required this.firestore,
    required this.auth,
  });

  Stream<DocumentSnapshot> get callStream =>
      firestore.collection('call').doc(auth.currentUser!.uid).snapshots();

  void makeCall(
      Call senderCallData,
      BuildContext context,
      Call receiverCallData,
      ) async {
    try {
      await firestore
          .collection('call')
          .doc(senderCallData.callerId)
          .set(senderCallData.toMap());
      await firestore
          .collection('call')
          .doc(senderCallData.receiverId)
          .set(receiverCallData.toMap());
      print('object');
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallScreen(
            channelId: senderCallData.callId,
            call: senderCallData,
            isGroupChat: false,
          ),
        ),
      );

    } catch (e) {
      showSnackBarFailure(
        context: context,
        title: ConstantStrings.error,
        message: e.toString(),
      );
    }
  }

  void makeGroupCall(
      Call senderCallData,
      BuildContext context,
      Call receiverCallData,
      ) async {
    try {
      await firestore
          .collection('call')
          .doc(senderCallData.callerId)
          .set(senderCallData.toMap());

      var groupSnapshot = await firestore
          .collection('groups')
          .doc(senderCallData.receiverId)
          .get();
      Group group = Group.fromMap(groupSnapshot.data()!);

      for (var id in group.membersUid) {
        await firestore
            .collection('call')
            .doc(id)
            .set(receiverCallData.toMap());
      }

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => CallScreen(
      //       channelId: senderCallData.callId,
      //       call: senderCallData,
      //       isGroupChat: true,
      //     ),
      //   ),
      // );

    } catch (e) {
      showSnackBarFailure(
        context: context,
        title: ConstantStrings.error,
        message: e.toString(),
      );
    }
  }

  void endCall(
      String callerId,
      String receiverId,
      BuildContext context,
      ) async {
    try {
      await firestore.collection('call').doc(callerId).delete();
      await firestore.collection('call').doc(receiverId).delete();
    } catch (e) {
      showSnackBarFailure(
        context: context,
        title: ConstantStrings.error,
        message: e.toString(),
      );
    }
  }

  void endGroupCall(
      String callerId,
      String receiverId,
      BuildContext context,
      ) async {
    try {
      await firestore.collection('call').doc(callerId).delete();
      var groupSnapshot =
      await firestore.collection('groups').doc(receiverId).get();
      Group group = Group.fromMap(groupSnapshot.data()!);
      for (var id in group.membersUid) {
        await firestore.collection('call').doc(id).delete();
      }
    } catch (e) {
      showSnackBarFailure(
        context: context,
        title: ConstantStrings.error,
        message: e.toString(),
      );
    }
  }
}