import 'dart:async';
import 'package:chat_app/constant/fakeData.dart';
import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/mvvm/view/screen/chat/chat_appbar.dart';
import 'package:chat_app/mvvm/view/screen/chat/widget/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChatDetailScreenState createState() {
    return _ChatDetailScreenState();
  }
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 200), () {
      _scrollToEnd();
    });
    KeyboardVisibilityController().onChange.listen((bool visible) async {
      if (visible) {
        Timer(const Duration(milliseconds: 200), () {
          _scrollToEnd();
        });
      }
    });
  }

  void _scrollToEnd() {
    if (!scrollController.hasClients) {
      return;
    }

    var scrollPosition = scrollController.position;

    if (scrollPosition.maxScrollExtent > scrollPosition.minScrollExtent) {
      scrollController.animateTo(
        scrollPosition.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatDetailPageAppBar(),
      body: Container(
        color: Theme.of(context).cardColor.withOpacity(0.8),
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: const [
                  ChatList(),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 16, bottom: 10),
                height: 80,
                width: double.infinity,
                color: Theme.of(context).cardColor,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showModal();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Theme.of(context).cardColor,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: ConstantStrings.enterMessage,
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .canvasColor
                                  .withOpacity(0.3)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        _scrollToEnd();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.send,
                          color: Theme.of(context).cardColor,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Container(
                  height: 4,
                  width: 50,
                  color: Theme.of(context).cardColor.withOpacity(0.2),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemCount: FakeData.menuItems.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: FakeData.menuItems[index].color.shade50,
                        ),
                        height: 50,
                        width: 50,
                        child: Icon(
                          FakeData.menuItems[index].icons,
                          size: 20,
                          color: FakeData.menuItems[index].color.shade400,
                        ),
                      ),
                      title: Text(FakeData.menuItems[index].text),
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
