import 'package:chat_app/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return LoginViewModel(authRepository: authRepository, ref: ref);
});

class LoginViewModel {
  final AuthRepository authRepository;
  final ProviderRef ref;

  LoginViewModel({
    required this.authRepository,
    required this.ref,
  });

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signInWithPhone(context, phoneNumber);
  }
}
