import 'package:chat_app/constant/strings.dart';
import 'package:flutter/material.dart';

class TabFriend extends StatefulWidget {
  const TabFriend({Key? key}) : super(key: key);

  @override
  State<TabFriend> createState() => _TabStatusState();
}

class _TabStatusState extends State<TabFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(ConstantStrings.friend),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: Image.network(
        'https://www.kindacode.com/wp-content/uploads/2022/05/green.jpeg',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
