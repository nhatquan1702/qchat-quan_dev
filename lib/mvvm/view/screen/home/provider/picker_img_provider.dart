import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickerProvider extends ChangeNotifier{
  XFile? _xFile;
  XFile? get xFile => _xFile;

  void pickedImage(XFile xFile) {
    _xFile = xFile;
    notifyListeners();
  }
}