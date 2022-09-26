import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberNotifier with ChangeNotifier {
  PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'VN');

  PhoneNumber get phoneNumber => _phoneNumber;

  void updatePhoneNumber(PhoneNumber phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }
}

final phoneNumberProvider =
ChangeNotifierProvider<PhoneNumberNotifier>((ref) {
  return PhoneNumberNotifier();
});