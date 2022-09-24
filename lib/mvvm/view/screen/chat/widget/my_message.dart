import 'package:flutter/material.dart';

class MyMessageCard extends StatefulWidget {
  final String message;
  final String date;

  const MyMessageCard({Key? key, required this.message, required this.date})
      : super(key: key);

  @override
  State<MyMessageCard> createState() => _MyMessageCardState();
}

class _MyMessageCardState extends State<MyMessageCard> {
  bool isTapMess = false;
  void updateStatus() {
    setState(
      () {
        isTapMess = !isTapMess;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context);
    return Stack(
      children: [
        InkWell(
          onTap: () => updateStatus(),
          child: Container(
            padding:
                const EdgeInsets.only(left: 48, right: 24, top: 5, bottom: 5),
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
                    Text(widget.message),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        widget.date,
                        style: TextStyle(fontSize: 10, color: appColor.canvasColor.withOpacity(0.5)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        isTapMess
            ? Positioned(
                bottom: 0,
                right: 4,
                child: Icon(
                  Icons.circle,
                  size: 20,
                  color: appColor.canvasColor.withOpacity(0.5),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
