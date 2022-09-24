import 'package:chat_app/constant/fakeData.dart';
import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/mvvm/view/screen/chat/chat_user_list_item.dart';
import 'package:chat_app/widget/button_in_appbar.dart';
import 'package:flutter/material.dart';

class TabChats extends StatefulWidget {
  const TabChats({Key? key}) : super(key: key);

  @override
  State<TabChats> createState() => _TabChatsState();
}

class _TabChatsState extends State<TabChats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: _buildActionsAppBar(),
        backgroundColor: Theme.of(context).cardColor,
        elevation: 0.2,
        shadowColor: Theme.of(context).canvasColor,
        centerTitle: false,
        titleSpacing: 16,
        titleTextStyle: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
        title: Text(
          ConstantStrings.appName,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).cardColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
              itemCount: FakeData.chatUsers.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ChatUsersListItem(
                  text: FakeData.chatUsers[index].text,
                  secondaryText: FakeData.chatUsers[index].secondaryText,
                  image: FakeData.chatUsers[index].image,
                  time: FakeData.chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildActionsAppBar() {
    return [
      CustomButtonInAppbar(
        context: context,
        icon: Icons.search,
        function: () {},
      ),
      const SizedBox(
        width: 10,
      ),
      CustomButtonInAppbar(
        context: context,
        icon: Icons.more_vert,
        function: () {},
      ),
      const SizedBox(
        width: 16,
      ),
    ];
  }
}
