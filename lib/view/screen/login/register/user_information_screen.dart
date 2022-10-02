import 'dart:io';

import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/view/component/widget/base_button.dart';
import 'package:chat_app/view/component/provider/obscure_notifier.dart';
import 'package:chat_app/view/component/provider/picker_image_notifier.dart';
import 'package:chat_app/view/component/widget/show_dialog_update_image.dart';
import 'package:chat_app/view/component/widget/show_snackbar.dart';
import 'package:chat_app/view/screen/login/login_vew_model.dart';
import 'package:chat_app/view/screen/profile/edit_profile_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInformationScreen extends ConsumerStatefulWidget {
  const UserInformationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserInformationScreen> createState() =>
      _UserInformationScreenState();
}

class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController passController = TextEditingController();
  TextEditingController passAgainController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  void updateStatus() {
    ref.read(obscureProvider).updateObscure();
  }

  void updateStatusAgain() {
    ref.read(obscureProvider).updateObscureAgain();
  }

  void saveDataUserToFirebase(
    BuildContext context,
    String name,
    File imageAvatar,
    File imageCover,
  ) async {
    ref.read(authViewModelProvider).saveUserDataToFirebase(
          context,
          name,
          imageAvatar,
          imageCover,
        );
    Navigator.pushReplacementNamed(
      context,
      ConstantStringsRoute.routeToHomeScreen,
    );
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    passController.dispose();
    passAgainController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context);
    bool isObscure = ref.watch(obscureProvider).isObscure;
    bool isObscureAgain = ref.watch(obscureProvider).isObscureAgain;
    File? imageAvatar = ref.watch(pickerImageProvider).fileAvatar;
    File? imageCover = ref.watch(pickerImageProvider).fileCover;

    return Scaffold(
      backgroundColor: appColor.cardColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title: Text(
          ConstantStrings.updateInformation,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              children: [
                ProfilePic(
                  imageAvatar: imageAvatar,
                  imageCover: imageCover,
                  funPickAvatar: () => showChoiceImageDialog(
                    context,
                    ConstantStrings.avatar,
                    ref,
                    ConstantStrings.seeAvatar,
                    true,
                    true,
                  ),
                  funPickCover: () => showChoiceImageDialog(
                    context,
                    ConstantStrings.cover,
                    ref,
                    ConstantStrings.seeCover,
                    false,
                    true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    controller: nameController,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        color: appColor.canvasColor.withOpacity(0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: appColor.primaryColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: appColor.canvasColor.withOpacity(0.5),
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      labelText: ConstantStrings.name,
                      suffixStyle: TextStyle(color: appColor.primaryColor),
                      labelStyle: TextStyle(
                        color: appColor.canvasColor.withOpacity(0.5),
                      ),
                      hintText: ConstantStrings.hintName,
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: appColor.canvasColor.withOpacity(0.5),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty || !RegExp(r"^").hasMatch(value)) {
                        return ConstantStrings.notValidName;
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    controller: passController,
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        color: appColor.canvasColor.withOpacity(0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: appColor.primaryColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: appColor.canvasColor.withOpacity(0.5),
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      labelText: ConstantStrings.passwordTitle,
                      hintText: ConstantStrings.hintPassword,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => updateStatus(),
                        icon: isObscure
                            ? Icon(
                                Icons.visibility_off,
                                color: appColor.canvasColor.withOpacity(0.5),
                              )
                            : Icon(
                                Icons.visibility,
                                color: appColor.canvasColor.withOpacity(0.5),
                              ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                              .hasMatch(value)) {
                        return ConstantStrings.notValidPassword;
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    controller: passAgainController,
                    obscureText: isObscureAgain,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        color: appColor.canvasColor.withOpacity(0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: appColor.primaryColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: appColor.canvasColor.withOpacity(0.5),
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      labelText: ConstantStrings.againPassword,
                      hintText: ConstantStrings.hintAgainPassword,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => updateStatusAgain(),
                        icon: isObscureAgain
                            ? Icon(
                                Icons.visibility_off,
                                color: appColor.canvasColor.withOpacity(0.5),
                              )
                            : Icon(
                                Icons.visibility,
                                color: appColor.canvasColor.withOpacity(0.5),
                              ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                              .hasMatch(value)) {
                        return ConstantStrings.notValidPassword;
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                BaseButtonFilled(
                  radius: 10,
                  title: ConstantStrings.completed,
                  color: appColor.primaryColor,
                  rootContext: context,
                  onTap: () {
                    nameController.text = 'Quang Phạm';
                    passController.text = 'Quan@.123';
                    passAgainController.text = 'Quan@.123';
                    String name = nameController.text.toString().trim();
                    if (imageAvatar == null) {
                      showSnackBarWarning(
                        context: context,
                        title: ConstantStrings.notification,
                        message: ConstantStrings.pleasePickImageAvatar,
                      );
                    }
                    else if (imageCover == null) {
                      showSnackBarWarning(
                        context: context,
                        title: ConstantStrings.notification,
                        message: ConstantStrings.pleasePickImageCover,
                      );
                    }
                    else if (formKey.currentState!.validate()) {
                      // ignore: use_build_context_synchronously
                      saveDataUserToFirebase(
                        context,
                        name,
                        imageAvatar,
                        imageCover,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
