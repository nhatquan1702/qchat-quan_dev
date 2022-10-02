import 'dart:io';

import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/data/model/response/user_model.dart';
import 'package:chat_app/data/repository/firebase_stogare_repository.dart';
import 'package:chat_app/view/component/widget/show_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository({
    required this.auth,
    required this.firestore,
  });

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: ((String verificationId, int? resendToken) async {
          Navigator.pushNamed(
            context,
            ConstantStringsRoute.routeToVerificationScreen,
            arguments: {
              'phoneNumber': phoneNumber,
              'verificationId': verificationId,
              'resendToken': resendToken,
            },
          );
        }),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      showSnackBarFailure(
        context: context,
        title: ConstantStrings.error,
        message: e.message!,
      );
    }
  }

  void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );
      await auth.signInWithCredential(credential);
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
        context,
        ConstantStringsRoute.routeToHomeScreen,
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      showSnackBarFailure(
        context: context,
        title: ConstantStrings.error,
        message: e.message!,
      );
    }
  }

  void saveUserDataToFirebase({
    required String name,
    required File? imageAvatar,
    required File? imageCover,
    required ProviderRef ref,
    required BuildContext context,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoAvatarUrl =
          'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png';
      String photoCoverUrl =
          'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png';

      if (imageAvatar != null) {
        photoAvatarUrl = await ref
            .read(firebaseStorageRepositoryProvider)
            .storeFileToFirebase(
              'pickerImageAvatar/$uid',
              imageAvatar,
            );
      }

      if (imageCover != null) {
        photoCoverUrl = await ref
            .read(firebaseStorageRepositoryProvider)
            .storeFileToFirebase(
              'pickerImageCover/$uid',
              imageCover,
            );
      }

      var user = UserModel(
        name: name,
        uid: uid,
        avatarUrl: photoAvatarUrl,
        coverUrl: photoCoverUrl,
        isOnline: true,
        phoneNumber: auth.currentUser!.phoneNumber!,
        groupId: [],
      );

      await firestore.collection('users').doc(uid).set(user.toMap());

      // ignore: use_build_context_synchronously
      Navigator.pushNamed(
        context,
        ConstantStringsRoute.routeToHomeScreen,
      );
    } catch (e) {
      showSnackBarFailure(
        context: context,
        title: ConstantStrings.error,
        message: e.toString(),
      );
    }
  }

  Future<UserModel?> getCurrentUserData() async {
    var userData =
    await firestore.collection('users').doc(auth.currentUser?.uid).get();

    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }

  Stream<UserModel> getUserDataById(String userId) {
    return firestore.collection('users').doc(userId).snapshots().map(
          (event) => UserModel.fromMap(
        event.data()!,
      ),
    );
  }

  void setUserState(bool isOnline) async {
    await firestore.collection('users').doc(auth.currentUser!.uid).update({
      'isOnline': isOnline,
    });
  }
}
