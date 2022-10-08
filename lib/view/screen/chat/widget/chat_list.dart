import 'package:chat_app/data/model/response/message.dart';
import 'package:chat_app/data/repository/message_reply_repository.dart';
import 'package:chat_app/view/component/enum/message_enum.dart';
import 'package:chat_app/view/screen/chat/chat_view_model.dart';
import 'package:chat_app/view/screen/chat/widget/my_message.dart';
import 'package:chat_app/view/screen/chat/widget/send_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ChatList extends ConsumerStatefulWidget {
  final String receiverUserId;
  final bool isGroupChat;

  const ChatList({
    super.key,
    required this.receiverUserId,
    required this.isGroupChat,
  });

  @override
  ConsumerState<ChatList> createState() => _ChatListState();
}

class _ChatListState extends ConsumerState<ChatList> {
  final ScrollController messageController = ScrollController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  void onMessageSwipe(
    String message,
    bool isMe,
    MessageEnum messageEnum,
  ) {
    ref.read(messageReplyProvider.state).update(
          (state) => MessageReply(
            message,
            isMe,
            messageEnum,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Message>>(
      stream: widget.isGroupChat
          ? ref
              .read(chatViewModelProvider)
              .groupChatStream(widget.receiverUserId)
          : ref.read(chatViewModelProvider).chatStream(widget.receiverUserId),
      builder: (context, snapshot) {
        if(snapshot.data == null){
          return const SizedBox();
        }
        else{
          return ListView.builder(
            controller: messageController,
            itemCount: snapshot.data!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final messageData = snapshot.data![index];
              var timeSent = DateFormat.Hm().format(messageData.timeSent);

              if (!messageData.isSeen &&
                  messageData.recieverid ==
                      FirebaseAuth.instance.currentUser!.uid) {
                ref.read(chatViewModelProvider).setChatMessageSeen(
                  context,
                  widget.receiverUserId,
                  messageData.messageId,
                );
              }

              if (messageData.senderId ==
                  FirebaseAuth.instance.currentUser!.uid) {
                return MyMessageCard(
                  message: messageData.text,
                  date: timeSent,
                  type: messageData.type,
                  repliedText: messageData.repliedMessage,
                  username: messageData.repliedTo,
                  repliedMessageType: messageData.repliedMessageType,
                  onLeftSwipe: () => onMessageSwipe(
                    messageData.text,
                    true,
                    messageData.type,
                  ),
                  isSeen: messageData.isSeen,
                  avatarUrl: null,
                );
              }
              return SendMessageCard(
                message: messageData.text,
                date: timeSent,
                type: messageData.type,
                username: messageData.repliedTo,
                repliedMessageType: messageData.repliedMessageType,
                onRightSwipe: () => onMessageSwipe(
                  messageData.text,
                  false,
                  messageData.type,
                ),
                repliedText: messageData.repliedMessage,
                avatarUrl: null,
              );
            },
          );
        }
      },
    );
  }
}
