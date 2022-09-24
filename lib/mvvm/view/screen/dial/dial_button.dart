import 'package:flutter/material.dart';

class DialButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback press;

  const DialButton(
      {super.key, required this.icon, required this.text, required this.press});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          children: [
            InkWell(
              onTap: press,
              child: Icon(
                icon,
                color: Theme.of(context).canvasColor,
                size: 24,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(
                color: Theme.of(context).canvasColor,
                fontSize: 13,
              ),
            )
          ],
        ),
      ),
    );
  }
}
