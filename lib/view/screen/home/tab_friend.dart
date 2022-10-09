import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/data/model/response/chat_contact.dart';
import 'package:chat_app/view/component/widget/button_in_appbar.dart';
import 'package:chat_app/view/screen/chat/chat_view_model.dart';
import 'package:chat_app/view/screen/chat/widget/contact_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabFriend extends ConsumerStatefulWidget {
  const TabFriend({Key? key}) : super(key: key);

  @override
  ConsumerState<TabFriend> createState() => _TabStatusState();
}

class _TabStatusState extends ConsumerState<TabFriend> {

  void goToChatDetailScreen(
      String uid,
      bool isGroup,
      String avatarUrl,
      String name,
      ) {
    Navigator.pushNamed(
      context,
      ConstantStringsRoute.routeToChatDetailScreen,
      arguments: {
        'uid': uid,
        'isGroupChat': isGroup,
        'avatarUrl': avatarUrl,
        'name': name,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context);

    return SizedBox(
      child: Scaffold(
        backgroundColor: appColor.cardColor,
        appBar: AppBar(
          backgroundColor: appColor.cardColor,
          title: Text(
            ConstantStrings.friend,
            style: TextStyle(color: appColor.primaryColor),
          ),
          centerTitle: false,
          actions: _buildActionsAppBar(context),
        ),
        body: StreamBuilder<List<ChatContact>>(
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
                return ContactItem(
                  onTap: () => goToChatDetailScreen(
                    chatContactItem.contactId,
                    false,
                    chatContactItem.avatarImageUrl,
                    chatContactItem.name,
                  ),
                  displayName: chatContactItem.name,
                  avatarUrl: chatContactItem.avatarImageUrl,
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: appColor.primaryColor,
          onPressed: () {
            Navigator.pushNamed(
              context,
              ConstantStringsRoute.routeToShowSelectContactScreen,
            );
          },
          child: Icon(
            Icons.perm_contact_cal_rounded,
            color: appColor.cardColor,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildActionsAppBar(BuildContext context) {
    return [
      CustomButtonInAppbar(
        context: context,
        icon: Icons.search,
        function: () {},
      ),
      const SizedBox(
        width: 16,
      ),
    ];
  }
}
