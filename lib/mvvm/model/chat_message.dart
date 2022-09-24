import 'package:chat_app/mvvm/view/screen/chat/chat_screen.dart';

enum MessageType {
  Sender,
  Receiver,
}

class ChatMessage{
  String message;
  MessageType type;
  ChatMessage({required this.message, required this.type});
}