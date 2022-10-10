import 'dart:io';

import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/view/component/widget/picker_media.dart';
import 'package:chat_app/view/component/provider/picker_image_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> showChoiceImageDialog(
  BuildContext context,
  String titleDialog,
  WidgetRef ref,
  String titleSee,
  bool isAvatar,
  bool isHintSeeImage,
) {
  final myColor = Theme.of(context);

  void _selectImageAvatarFromGallery() async {
    File? imageAvatar = await pickImageFromGallery(context);
    ref.read(pickerImageProvider).pickedFirstAvatarImage(imageAvatar!);
  }

  void _selectImageAvatarFromCamera() async {
    File? imageAvatar = await pickImageFromCamera(context);
    ref.read(pickerImageProvider).pickedFirstAvatarImage(imageAvatar!);
  }

  void _selectImageCoverFromGallery() async {
    File? imageCover = await pickImageFromGallery(context);
    ref.read(pickerImageProvider).pickedFirstCoverImage(imageCover!);
  }

  void _selectImageCoverFromCamera() async {
    File? imageCover = await pickImageFromCamera(context);
    ref.read(pickerImageProvider).pickedFirstCoverImage(imageCover!);
  }

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            titleDialog,
            style: TextStyle(
              color: myColor.primaryColor,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                isHintSeeImage
                    ? const SizedBox()
                    : Divider(
                        height: 1,
                        color: myColor.primaryColor,
                      ),
                isHintSeeImage
                    ? const SizedBox()
                    : ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ConstantStringsRoute.routeToShowImageScreen,
                          );
                        },
                        title: Text(titleSee),
                        leading: Icon(
                          Icons.remove_red_eye,
                          color: myColor.primaryColor,
                        ),
                      ),
                Divider(
                  height: 1,
                  color: myColor.primaryColor,
                ),
                ListTile(
                  onTap: () {
                    if (isAvatar) {
                      _selectImageAvatarFromGallery();
                      Navigator.pop(context);
                    } else {
                      _selectImageCoverFromGallery();
                      Navigator.pop(context);
                    }
                  },
                  title: const Text(
                    ConstantStrings.pickImageGallery,
                  ),
                  leading: Icon(
                    Icons.account_box,
                    color: myColor.primaryColor,
                  ),
                ),
                Divider(
                  height: 1,
                  color: myColor.primaryColor,
                ),
                ListTile(
                  onTap: () {
                    if (isAvatar) {
                      _selectImageAvatarFromCamera();
                      Navigator.pop(context);
                    } else {
                      _selectImageCoverFromCamera();
                      Navigator.pop(context);
                    }
                  },
                  title: const Text(
                    ConstantStrings.pickImageCamera,
                  ),
                  leading: Icon(
                    Icons.camera_alt,
                    color: myColor.primaryColor,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      primary: myColor.primaryColor,
                    ),
                    child: Text(
                      ConstantStrings.cancel,
                      style: TextStyle(
                        color: myColor.cardColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
