import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/view/screen/home/tab_chat.dart';
import 'package:chat_app/view/screen/home/tab_friend.dart';
import 'package:chat_app/view/screen/home/tab_profile.dart';
import 'package:chat_app/view/component/provider/home_tab_notifier.dart';
import 'package:chat_app/view/screen/login/login_vew_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with WidgetsBindingObserver{
  static final List<Widget> _widgetOptions = <Widget>[
    const TabChats(),
    const TabFriend(),
    const TabProfile(),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        ref.read(authViewModelProvider).setUserState(true);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.paused:
        ref.read(authViewModelProvider).setUserState(false);
        break;
    }
  }

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
