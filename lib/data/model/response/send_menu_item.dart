import 'package:chat_app/view/component/enum/message_enum.dart';
import 'package:flutter/material.dart';

class SendMenuItems {
  String text;
  IconData icons;
  MaterialColor color;
  MessageEnum type;
  SendMenuItems({
    required this.text,
    required this.icons,
    required this.color,
    required this.type,
  });
}
