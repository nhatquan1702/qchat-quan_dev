import 'dart:io';

import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/view/component/widget/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImageFromGallery(BuildContext context) async {
  File? image;
  try {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    showSnackBarFailure(
      context: context,
      title: ConstantStrings.reload,
      message: e.toString(),
    );
  }
  return image;
}

Future<File?> pickImageFromCamera(BuildContext context) async {
  File? image;
  try {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    showSnackBarFailure(
      context: context,
      title: ConstantStrings.reload,
      message: e.toString(),
    );
  }
  return image;
}
