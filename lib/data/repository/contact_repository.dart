import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/data/model/response/user_model.dart';
import 'package:chat_app/view/component/widget/show_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectContactsRepositoryProvider = Provider(
  (ref) => SelectContactRepository(
    firestore: FirebaseFirestore.instance,
  ),
);

class SelectContactRepository {
  final FirebaseFirestore firestore;

  SelectContactRepository({
    required this.firestore,
  });

  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(
          withProperties: true,
          withPhoto: true,
          withThumbnail: true,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return contacts;
  }

  void selectContact(Contact selectedContact, BuildContext context) async {
    try {
      var userCollection = await firestore.collection('users').get();
      bool isFound = false;

      for (var document in userCollection.docs) {
        var userData = UserModel.fromMap(document.data());
        String selectedPhoneNum = selectedContact.phones.first.number.toString();
        if (selectedPhoneNum == userData.phoneNumber) {
          isFound = true;
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(
            context,
            ConstantStringsRoute.routeToChatDetailScreen,
            arguments: {
              'uid': userData.uid,
              'isGroupChat': false ,
            },
          );
        }
      }

      if (!isFound) {
        showSnackBarWarning(
          context: context,
          title: ConstantStrings.notification,
          message: ConstantStrings.numberDoesNotExist,
        );
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
