import 'package:chat_app/view/component/enum/message_enum.dart';
import 'package:chat_app/view/screen/chat/widget/display_media_message.dart';
import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';

class SendMessageCard extends StatelessWidget {
  final String message;
  final String date;
  final MessageEnum type;
  final VoidCallback onRightSwipe;
  final String repliedText;
  final String username;
  final MessageEnum repliedMessageType;
  final String? avatarUrl;

  const SendMessageCard({
    super.key,
    required this.message,
    required this.date,
    required this.type,
    required this.onRightSwipe,
    required this.repliedText,
    required this.username,
    required this.repliedMessageType,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context);
    return SwipeTo(
      onRightSwipe: onRightSwipe,
      child: Stack(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 30, right: 48, top: 5, bottom: 5),
            child: Align(
              alignment: (Alignment.topLeft),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: (appColor.cardColor).withOpacity(0.5),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DisplayMediaMessage(
                      message: message,
                      type: type,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        date,
                        style: TextStyle(
                          fontSize: 10,
                          color: appColor.canvasColor.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: 2,
            child: avatarUrl == null
                ? CircleAvatar(
                    backgroundColor: appColor.canvasColor.withOpacity(0.5),
                    maxRadius: 12,
                    child: Icon(
                      Icons.person,
                      color: appColor.canvasColor,
                      size: 12,
                    ),
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(avatarUrl!),
                    maxRadius: 12,
                  ),
          ),
        ],
      ),
    );
  }
}
