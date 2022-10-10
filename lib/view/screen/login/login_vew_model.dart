import 'dart:io';

import 'package:chat_app/data/model/response/user_model.dart';
import 'package:chat_app/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return LoginViewModel(authRepository: authRepository, ref: ref);
});

final userDataAuthProvider = FutureProvider((ref) {
  final authViewModel = ref.watch(authViewModelProvider);
  return authViewModel.getUserData();
});

class LoginViewModel {
  final AuthRepository authRepository;
  final ProviderRef ref;

  LoginViewModel({
    required this.authRepository,
    required this.ref,
  });

  void signInWithPhone(
    BuildContext context,
    String phoneNumber,
    bool isLogin,
  ) {
    authRepository.signInWithPhone(context, phoneNumber, isLogin);
  }

  void verifyOTP(
    BuildContext context,
    String verificationId,
    String userOTP,
    bool isLogin,
  ) {
    authRepository.verifyOTP(
      context: context,
      verificationId: verificationId,
      userOTP: userOTP,
      isLogin: isLogin,
    );
  }

  void saveUserDataToFirebase(
    BuildContext context,
    String name,
    File? avatarImage,
    File? coverImage,
  ) {
    authRepository.saveUserDataToFirebase(
      name: name,
      imageAvatar: avatarImage,
      imageCover: coverImage,
      ref: ref,
      context: context,
    );
  }

  Future<UserModel?> getUserData() async {
    UserModel? user = await authRepository.getCurrentUserData();
    return user;
  }

  Stream<UserModel> getUserDataById(String userId) {
    return authRepository.getUserDataById(userId);
  }

  void setUserState(bool isOnline) {
    authRepository.setUserState(isOnline);
  }
}
