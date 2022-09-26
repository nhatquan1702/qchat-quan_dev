import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerificationNotifier with ChangeNotifier {
  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;
  late Timer _timer;
  int _start = 60;
  int _currentIndex = 0;

  bool get isResendAgain => _isResendAgain;
  bool get isVerified => _isVerified;
  bool get isLoading => _isLoading;
  Timer get timer => _timer;
  int get start => _start;
  int get currentIndex => _currentIndex;

  void updateStatusResend(bool check) {
    _isResendAgain = check;
    notifyListeners();
  }

  void updateStatusLoading(bool check) {
    _isLoading = check;
    notifyListeners();
  }

  void updateStatusVerified(bool check) {
    _isVerified = check;
    notifyListeners();
  }

  void resend() {
    updateStatusResend(true);
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_start == 0) {
        _start = 60;
        updateStatusResend(false);
        timer.cancel();
      } else {
        _start--;
      }
      notifyListeners();
    });
  }

  void verify() {
    updateStatusLoading(true);
    const oneSec = Duration(milliseconds: 2000);
    _timer = Timer.periodic(oneSec, (timer) {
      updateStatusLoading(false);
      updateStatusVerified(true);
    });
    notifyListeners();
  }

  void updateCurrentIndex() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      _currentIndex++;
      if (_currentIndex == 3) {
        _currentIndex = 0;
      }
    });
    notifyListeners();
  }
}

final verificationProvider =
ChangeNotifierProvider<VerificationNotifier>((ref) {
  return VerificationNotifier();
});
