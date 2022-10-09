import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final VoidCallback onTap;
  final String displayName;
  final String avatarUrl;

  const ContactItem({
    super.key,
    required this.onTap,
    required this.displayName,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(avatarUrl),
                    maxRadius: 24,
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
                          Text(
                            displayName,
                            style: TextStyle(
                              fontSize: 16,
                              color: appColor.canvasColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.call,
                    color: appColor.primaryColor,
                    size: 24,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.video_call,
                    color: appColor.primaryColor,
                    size: 32,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
