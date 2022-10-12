import 'package:chat_app/view/component/enum/message_enum.dart';
import 'package:chat_app/view/component/provider/obscure_notifier.dart';
import 'package:chat_app/view/screen/chat/widget/display_media_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swipe_to/swipe_to.dart';

class MyMessageCard extends ConsumerStatefulWidget {
  final String message;
  final String date;
  final MessageEnum type;
  final VoidCallback onLeftSwipe;
  final String repliedText;
  final String username;
  final MessageEnum repliedMessageType;
  final bool isSeen;
  final String? avatarUrl;

  const MyMessageCard({
    super.key,
    required this.message,
    required this.date,
    required this.type,
    required this.onLeftSwipe,
    required this.repliedText,
    required this.username,
    required this.repliedMessageType,
    required this.isSeen,
    required this.avatarUrl,
  });

  @override
  ConsumerState<MyMessageCard> createState() => _MyMessageCardState();
}

class _MyMessageCardState extends ConsumerState<MyMessageCard> {
  void updateStatus() {
    ref.read(obscureProvider).updateStatusMessage();
  }

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context);
    final isTapMess = ref.watch(obscureProvider).isTapMessage;

    return SwipeTo(
      onLeftSwipe: widget.onLeftSwipe,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 48,
              right: 24,
              top: 5,
              bottom: 5,
            ),
            child: Align(
              alignment: (Alignment.topRight),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: (appColor.primaryColor).withOpacity(0.5),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DisplayMediaMessage(
                      message: widget.message,
                      type: widget.type,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        widget.date,
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
          widget.isSeen
              ? Positioned(
                  bottom: 0,
                  right: 4,
                  child: widget.avatarUrl == null
                      ? CircleAvatar(
                          backgroundColor:
                              appColor.canvasColor.withOpacity(0.5),
                          radius: 9,
                          child: Icon(
                            Icons.person,
                            size: 12,
                            color: appColor.cardColor,
                          ),
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage(widget.avatarUrl!),
                          maxRadius: 9,
                        ),
                )
              : Positioned(
                  bottom: 0,
                  right: 4,
                  child: Icon(
                    Icons.check_circle,
                    size: 20,
                    color: appColor.primaryColor,
                  ),
                )
        ],
      ),
    );
  }
}
