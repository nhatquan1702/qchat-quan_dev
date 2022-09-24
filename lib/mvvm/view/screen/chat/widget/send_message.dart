import 'package:flutter/material.dart';

class SendMessageCard extends StatelessWidget {
  const SendMessageCard({
    Key? key,
    required this.message,
    required this.date,
  }) : super(key: key);
  final String message;
  final String date;

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context);
    return Stack(
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 24, right: 48, top: 5, bottom: 5),
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
                  Text(message),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      date,
                      style: TextStyle(fontSize: 10, color: appColor.canvasColor.withOpacity(0.5)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Positioned(
          top: 8,
          left: 2,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg"),
            maxRadius: 10,
          ),
        ),
      ],
    );
  }
}
