import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/view/component/update_image.dart';
import 'package:chat_app/view/screen/profile/edit_profile_menu_item.dart';
import 'package:chat_app/view/screen/profile/edit_profile_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context);
    return Scaffold(
      backgroundColor: appColor.cardColor,
      appBar: AppBar(
        elevation: 0.2,
        shadowColor: appColor.canvasColor,
        backgroundColor: appColor.cardColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: appColor.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: appColor.primaryColor,
            ),
          ),
        ],
        title: Text(
          'Nhật Quang',
          style: TextStyle(color: appColor.primaryColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ProfilePic(
              imageAvatar: null,
              imageCover: null,
              funPickAvatar: () => showChoiceImageDialog(
                context,
                ConstantStrings.avatar,
                ref,
                ConstantStrings.seeCover,
              ),
              funPickCover: () => showChoiceImageDialog(
                context,
                ConstantStrings.cover,
                ref,
                ConstantStrings.seeCover,
              ),
            ),
            const SizedBox(height: 20),
            ProfileMenu(
              text: ConstantStrings.updateAvatar,
              icon: Icons.image_outlined,
              press: () => {},
            ),
            ProfileMenu(
              text: ConstantStrings.updateCover,
              icon: Icons.image_aspect_ratio,
              press: () => {},
            ),
            ProfileMenu(
              text: ConstantStrings.updateName,
              icon: Icons.drive_file_rename_outline,
              press: () => {},
            ),
            ProfileMenu(
              text: ConstantStrings.updateNumberPhone,
              icon: Icons.phone,
              press: () {},
            ),
            ProfileMenu(
              text: ConstantStrings.updateIntroduction,
              icon: Icons.person,
              press: () {},
            ),
            ProfileMenu(
              text: ConstantStrings.logout,
              icon: Icons.logout,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
