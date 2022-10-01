import 'dart:math';
import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/view/component/widget/button_in_appbar.dart';
import 'package:chat_app/view/component/provider/picker_image_notifier.dart';
import 'package:chat_app/view/component/provider/scroll_notifier.dart';
import 'package:chat_app/view/component/widget/show_dialog_update_image.dart';
import 'package:chat_app/view/screen/home/widget/custom_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabProfile extends ConsumerStatefulWidget {
  const TabProfile({Key? key}) : super(key: key);

  @override
  ConsumerState<TabProfile> createState() => _TabCallsState();
}

class _TabCallsState extends ConsumerState<TabProfile> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      ref.read(scrollableProvider).scrollable(_scrollController);
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int position = ref.watch(scrollableProvider).position;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).cardColor,
      appBar: position < 50
          ? null
          : AppBar(
              actions: _buildActionsAppBar(),
              leading: const Padding(
                padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg"),
                  maxRadius: 20,
                ),
              ),
              backgroundColor: Theme.of(context)
                  .cardColor
                  .withOpacity(max(0, min(1, position / 280))),
              elevation: 0.2,
              shadowColor: Theme.of(context).canvasColor,
              centerTitle: false,
              titleSpacing: 8,
              titleTextStyle: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
              ),
              title: Text(
                'Nhật Quang',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildBody(context),
            //_buildAmount(),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(MediaQuery.of(context).size.width - 48, 32),
                ),
                elevation: MaterialStateProperty.all<double>(0.0),
                foregroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).cardColor,
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ConstantStringsRoute.routeToEditProfileScreen,
                );
              },
              child: Text(
                ConstantStrings.editProfile.toUpperCase(),
                style: const TextStyle(fontSize: 14),
              ),
            ),
            // _buildListPhoto(context),
            Container(
              height: 1000,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarImg(BuildContext context) {
    final imagePickedAvatar = ref.watch(pickerImageProvider).fileAvatar;
    final appColor = Theme.of(context);

    return InkWell(
      onTap: () {
        showChoiceImageDialog(
          context,
          ConstantStrings.avatar,
          ref,
          ConstantStrings.seeAvatar,
          true,
          imagePickedAvatar == null ? true : false,
        );
      },
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(144 / 2),
      ),
      child: Container(
        width: 144.0,
        height: 144.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(144 / 2)),
          border: Border.all(
            color: Theme.of(context).cardColor,
            width: 5.0,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(144 / 2),
          child: imagePickedAvatar == null
              ? Container(
                  color: appColor.canvasColor.withOpacity(0.1),
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    color: appColor.canvasColor,
                  ),
                )
              : Image.file(
                  imagePickedAvatar,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

  List<Widget> _buildActionsAppBar() {
    return [
      CustomButtonInAppbar(
        context: context,
        icon: Icons.more_vert,
        function: () {
          Navigator.pushNamed(
            context,
            ConstantStringsRoute.routeToEditProfileScreen,
          );
        },
      ),
      const SizedBox(
        width: 16,
      ),
    ];
  }

  Widget _buildBody(BuildContext context) {
    double offset = ref.watch(scrollableProvider).offset;
    final imagePickedCover = ref.watch(pickerImageProvider).fileCover;

    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: CustomScrollviewAppBar(
                //ảnh bìa
                offset: offset,
                onTap: () => showChoiceImageDialog(
                  context,
                  ConstantStrings.cover,
                  ref,
                  ConstantStrings.seeCover,
                  false,
                  imagePickedCover == null ? true : false,
                ),
                file: imagePickedCover,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            _buildAvatarImg(context)
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Nhật Quang',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Theme.of(context).canvasColor,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Graphic Designer',
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).canvasColor.withOpacity(0.8),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 48),
              child: Center(
                child: Text(
                  '"Trăng vẫn trôi, vẫn sáng. Người phủ phàng dẫn lối"',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).canvasColor.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
