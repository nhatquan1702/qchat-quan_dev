import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/view/component/provider/picker_image_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

Future<void> showChoiceImageDialog(BuildContext context, String titleDialog, WidgetRef ref, String titleSee) {
  final myColor = Theme.of(context);
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
                Divider(
                  height: 1,
                  color: myColor.primaryColor,
                ),
                ListTile(
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
                    _openGallery(context, ref);
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
                    _openCamera(context, ref);
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

void _openGallery(BuildContext context, WidgetRef ref) async {
  final pickedFile = await ImagePicker().pickImage(
    source: ImageSource.gallery,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  // ignore: use_build_context_synchronously
  ref.read(pickerImageProvider.notifier).pickedImage(pickedFile!);
  // ignore: use_build_context_synchronously
  Navigator.pop(context);
}

void _openCamera(BuildContext context, WidgetRef ref) async {
  final pickedFile = await ImagePicker().pickImage(
    source: ImageSource.camera,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  // ignore: use_build_context_synchronously
  ref.read(pickerImageProvider.notifier).pickedImage(pickedFile!);
  // ignore: use_build_context_synchronously
  Navigator.pop(context);
}