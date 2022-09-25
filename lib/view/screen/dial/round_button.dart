import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final double size;
  final IconData icon;
  final Color color, iconColor;
  final VoidCallback press;

  const RoundedButton(
      {super.key,
        required this.size,
        required this.icon,
        required this.color,
        required this.iconColor,
        required this.press});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: MaterialButton(
        padding: EdgeInsets.all(15 / 64 * size),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        color: color,
        onPressed: press,
        child: Center(
          child: IconButton(
            icon: Icon(icon),
            color: iconColor,
            onPressed: press,
            iconSize: 24,
          ),
        ),
      ),
    );
  }
}
