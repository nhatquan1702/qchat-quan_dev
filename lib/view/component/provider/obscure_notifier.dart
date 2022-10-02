import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObscureNotifier with ChangeNotifier {
  bool _isObscure = true;
  bool _changeButton = false;
  bool _isObscureAgain = true;
  bool _changeSendButton = false;
  bool _isRecorderInit = false;
  bool _isShowEmojiContainer = false;
  bool _isRecording = false;

  bool get isObscure => _isObscure;
  bool get changeButton => _changeButton;
  bool get isObscureAgain => _isObscureAgain;
  bool get changeSendButton => _changeSendButton;
  bool get isRecorderInit => _isRecorderInit;
  bool get isShowEmojiContainer => _isShowEmojiContainer;
  bool get isRecording => _isRecording;

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

  void updateSendButton(bool check) {
    _changeSendButton =  check;
    notifyListeners();
  }

  void updateStatusRecorderInit(bool check) {
    _isRecorderInit =  check;
    notifyListeners();
  }

  void updateStatusShowEmojiContainer(bool check) {
    _isShowEmojiContainer =  check;
    notifyListeners();
  }

  void updateStatusRecording() {
    _isRecording =  !_isRecording;
    notifyListeners();
  }
}

final obscureProvider = ChangeNotifierProvider<ObscureNotifier>((ref) {
  return ObscureNotifier();
});