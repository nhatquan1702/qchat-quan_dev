import 'dart:io';

import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/view/component/widget/show_snackbar.dart';
import 'package:enough_giphy_flutter/enough_giphy_flutter.dart';
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

Future<File?> pickVideoFromGallery(BuildContext context) async {
  File? video;
  try {
    final pickedVideo =
    await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (pickedVideo != null) {
      video = File(pickedVideo.path);
    }
  } catch (e) {
    showSnackBarFailure(
      context: context,
      title: ConstantStrings.reload,
      message: e.toString(),
    );
  }
  return video;
}

Future<GiphyGif?> pickGIF(BuildContext context) async {
  GiphyGif? gif;
  try {
    gif = await Giphy.getGif(
      lang: GiphyLanguage.vietnamese,
      context: context,
      apiKey: 'pwXu0t7iuNVm8VO5bgND2NzwCpVH9S0F',
      keepState: true,
      showPreview: true,
      headerGifsText: 'Gif',
      headerStickersText: 'Sticker',
      headerEmojiText: 'Emoji',
      showSearch: false
    );
  } catch (e) {
    showSnackBarFailure(
      context: context,
      title: ConstantStrings.reload,
      message: e.toString(),
    );
  }
  return gif;
}
