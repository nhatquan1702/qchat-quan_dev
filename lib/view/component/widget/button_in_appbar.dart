import 'package:flutter/material.dart';

class CustomButtonInAppbar extends StatelessWidget {
  final BuildContext context;
  final IconData icon;
  final VoidCallback function;
  const CustomButtonInAppbar(
      {super.key,
      required this.context,
      required this.icon,
      required this.function});

  @override
  Widget build(BuildContext context) {
    // return InkWell(
    //   onTap: function,
    //   child: Ink(
    //     padding: const EdgeInsets.symmetric(vertical: 10),
    //     child: Container(
    //       width: 36,
    //       height: 36,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(12),
    //         color: Theme.of(context).primaryColor.withOpacity(0.2),
    //       ),
    //       child: Center(
    //         child: Icon(
    //           icon,
    //           color: Theme.of(context).primaryColor,
    //           size: 20,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: 36,
      height: 36,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 9),
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            primary: Theme.of(context).primaryColor.withOpacity(0.2)),
        child: Center(
          child: Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 20,
          ),
        ),
      ),
    );
  }
}
