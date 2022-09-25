import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/view/screen/home/tab_chat.dart';
import 'package:chat_app/view/screen/home/tab_friend.dart';
import 'package:chat_app/view/screen/home/tab_profile.dart';
import 'package:chat_app/view/screen/home/view_model/home_tab_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  static const List<Widget> _widgetOptions = <Widget>[
    TabChats(),
    TabFriend(),
    TabProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    final int selectedIndex = ref.watch(selectedIndexProvider).selectedIndex;
    return Container(
      color: Theme.of(context).cardColor,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).cardColor,
            elevation: 0,
            selectedFontSize: 16,
            unselectedFontSize: 16,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: ConstantStrings.chat,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: ConstantStrings.friend,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: ConstantStrings.account,
              ),
            ],
            selectedItemColor: Theme.of(context).primaryColor,
            currentIndex: selectedIndex,
            onTap: (int index) =>
                ref.read(selectedIndexProvider.notifier).onItemTapped(index),
          ),
        ),
      ),
    );
  }
}
