import 'package:flutter/material.dart';

class NumberOfNotification extends StatefulWidget {
  const NumberOfNotification({Key? key, required this.number})
      : super(key: key);
  final int number;
  @override
  State<NumberOfNotification> createState() => _NumberOfNotificationState();
}

class _NumberOfNotificationState extends State<NumberOfNotification> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipOval(
        child: Container(
          height: 24,
          width: 24,
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Text(
              '${widget.number}+',
              style: TextStyle(
                fontSize: 10,
                color: Theme.of(context).cardColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
