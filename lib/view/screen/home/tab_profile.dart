import 'dart:io';
import 'dart:math';
import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/view/component/button_in_appbar.dart';
import 'package:chat_app/view/screen/home/view_model/picker_image_notifier.dart';
import 'package:chat_app/view/screen/home/widget/custom_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class TabProfile extends ConsumerStatefulWidget {
  const TabProfile({Key? key}) : super(key: key);

  @override
  ConsumerState<TabProfile> createState() => _TabCallsState();
}

class _TabCallsState extends ConsumerState<TabProfile> {
  late ScrollController _scrollController;
  double _scrollPosition = 0.0;
  int _position = 0;
  double _offset = 0.0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
      _position = _scrollPosition.toInt();
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _scrollController.addListener(() {
      setState(() {
        _offset = _scrollController.offset;
      });
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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).cardColor,
      appBar: _position < 50
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
                  .withOpacity(max(0, min(1, _position / 280))),
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

  Future<void> _showChoiceDialog(BuildContext context) {
    final myColor = Theme.of(context);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              ConstantStrings.avatar,
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
                    title: const Text(ConstantStrings.seeAvatar),
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
                      _openGallery(context);
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
                      _openCamera(context);
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

  void _openGallery(BuildContext context) async {
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

  void _openCamera(BuildContext context) async {
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

  Widget _buildAvatarImg() {
    final imagePicked = ref.watch(pickerImageProvider).xFile;
    return InkWell(
      onTap: () {
        _showChoiceDialog(context);
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
          child: imagePicked != null
              ? Image.file(
                  File(imagePicked.path),
                  fit: BoxFit.cover,
                )
              : Image.network(
                  'https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg',
                  fit: BoxFit.cover),
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
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: CustomScrollviewAppBar(offset: _offset),
            ),
            const SizedBox(
              height: 50,
            ),
            _buildAvatarImg()
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
