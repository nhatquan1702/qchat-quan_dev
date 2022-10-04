import 'package:chat_app/constant/strings.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatUsersListItem extends StatefulWidget {
  String nameDisplay;
  String lastMessage;
  String avatarImageUrl;
  String timeSentMessage;
  bool isMessageRead;
  ChatUsersListItem(
      {Key? key,
      required this.nameDisplay,
      required this.lastMessage,
      required this.avatarImageUrl,
      required this.timeSentMessage,
      required this.isMessageRead})
      : super(key: key);

  @override
  State<ChatUsersListItem> createState() => _ChatUsersListItemState();
}

class _ChatUsersListItemState extends State<ChatUsersListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ConstantStringsRoute.routeToChatDetailScreen,
        );
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.avatarImageUrl),
                    maxRadius: 30,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.nameDisplay),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.lastMessage,
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context)
                                  .canvasColor
                                  .withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.timeSentMessage,
              style: TextStyle(
                fontSize: 12,
                color: widget.isMessageRead
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).canvasColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
