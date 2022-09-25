enum MessageType {
  Sender,
  Receiver,
}

class ChatMessage{
  String message;
  MessageType type;
  ChatMessage({required this.message, required this.type});
}