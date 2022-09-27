import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu(
      {Key? key,
      required this.text,
      required this.icon,
      this.press,
      this.color})
      : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback? press;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: appColor.canvasColor,
          padding: const EdgeInsets.all(16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: appColor.canvasColor.withOpacity(0.1),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              color: appColor.canvasColor,
            ),
            const SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: appColor.canvasColor,
            ),
          ],
        ),
      ),
    );
  }
}
