import 'package:chat_app/constant/strings.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatUsersListItem extends StatefulWidget {
  String text;
  String secondaryText;
  String image;
  String time;
  bool isMessageRead;
  ChatUsersListItem(
      {Key? key,
      required this.text,
      required this.secondaryText,
      required this.image,
      required this.time,
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
                    backgroundImage: NetworkImage(widget.image),
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
                          Text(widget.text),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.secondaryText,
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
              widget.time,
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
