import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/data/model/response/chat_contact.dart';
import 'package:chat_app/view/component/widget/button_in_appbar.dart';
import 'package:chat_app/view/screen/chat/chat_user_list_item.dart';
import 'package:chat_app/view/screen/chat/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TabChats extends ConsumerStatefulWidget {
  const TabChats({Key? key}) : super(key: key);

  @override
  ConsumerState<TabChats> createState() => _TabChatsState();
}

class _TabChatsState extends ConsumerState<TabChats> {
  void goToChatDetailScreen(String uid, bool isGroup) {
    Navigator.pushNamed(
      context,
      ConstantStringsRoute.routeToChatDetailScreen,
      arguments: {
        'uid': uid,
        'isGroupChat': isGroup,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: _buildActionsAppBar(),
        backgroundColor: appColor.cardColor,
        elevation: 0.2,
        shadowColor: appColor.canvasColor,
        centerTitle: false,
        titleSpacing: 16,
        titleTextStyle: TextStyle(
          color: appColor.primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
        title: Text(
          ConstantStrings.appName,
          style: TextStyle(
            color: appColor.primaryColor,
          ),
        ),
      ),
      backgroundColor: appColor.cardColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            StreamBuilder<List<ChatContact>>(
              stream: ref.watch(chatViewModelProvider).chatContacts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox();
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var chatContactItem = snapshot.data![index];
                    return ChatUsersListItem(
                      onTap: () => goToChatDetailScreen(
                        chatContactItem.contactId,
                        false,
                      ),
                      nameDisplay: chatContactItem.name,
                      lastMessage: chatContactItem.lastMessage,
                      avatarImageUrl: chatContactItem.avatarImageUrl,
                      timeSentMessage:
                          DateFormat.Hm().format(chatContactItem.timeSent),
                      isMessageRead: (index == 0 || index == 3) ? true : false,
                    );
                  },
                );
              },
            ),
            // StreamBuilder<List<Group>>(
            //   stream: ref.watch(chatViewModelProvider).chatGroups(),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const LoadingScreen();
            //     }
            //     return ListView.builder(
            //       itemCount: snapshot.data!.length,
            //       shrinkWrap: true,
            //       padding: const EdgeInsets.only(top: 16),
            //       physics: const NeverScrollableScrollPhysics(),
            //       itemBuilder: (context, index) {
            //         var groupChatItem = snapshot.data![index];
            //         return ChatUsersListItem(
            //           onTap: () => goToChatDetailScreen(
            //             groupChatItem.groupId,
            //             false,
            //           ),
            //           nameDisplay: groupChatItem.name,
            //           lastMessage: groupChatItem.lastMessage,
            //           avatarImageUrl: groupChatItem.groupPic,
            //           timeSentMessage:
            //               DateFormat.Hm().format(groupChatItem.timeSent),
            //           isMessageRead: (index == 0 || index == 3) ? true : false,
            //         );
            //       },
            //     );
            //   },
            // )
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
