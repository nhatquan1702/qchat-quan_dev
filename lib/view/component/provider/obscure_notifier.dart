import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObscureNotifier with ChangeNotifier {
  bool _isObscure = true;
  bool _changeButton = false;
  bool _isObscureAgain = true;

  bool get isObscure => _isObscure;
  bool get changeButton => _changeButton;
  bool get isObscureAgain => _isObscureAgain;

  void updateObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  void updateButton(bool check) {
    _changeButton =  check;
    notifyListeners();
  }

  void updateObscureAgain() {
    _isObscureAgain = !_isObscureAgain;
    notifyListeners();
  }
}

final obscureProvider = ChangeNotifierProvider<ObscureNotifier>((ref) {
  return ObscureNotifier();
});