import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObscureNotifier with ChangeNotifier {
  bool _isObscure = true;
  bool _changeButton = false;

  bool get isObscure => _isObscure;
  bool get changeButton => _changeButton;

  void updateObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  void updateButton(bool check) {
    _changeButton =  check;
    notifyListeners();
  }
}

final obscureProvider = ChangeNotifierProvider<ObscureNotifier>((ref) {
  return ObscureNotifier();
});