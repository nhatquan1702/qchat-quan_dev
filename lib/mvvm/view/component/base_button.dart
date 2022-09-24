import 'package:flutter/material.dart';

class BaseButtonFilled extends StatelessWidget {
  final BuildContext rootContext;
  final VoidCallback? onTap;
  final Color? color;
  final String title;
  final double radius;
  final double marginHorizontal;
  final double marginVertical;
  final bool isShadow;
  final bool isRowTitle;
  final IconData? iconData;
  final bool isFullScreenWidth;
  final double paddingHorizontal;

  const BaseButtonFilled({
    Key? key,
    required this.rootContext,
    this.onTap,
    this.color,
    this.title = 'title',
    this.radius = 100,
    this.marginHorizontal = 16.0,
    this.marginVertical = 0.0,
    this.isShadow = false,
    this.isRowTitle = false,
    this.iconData,
    this.isFullScreenWidth = true,
    this.paddingHorizontal = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width:
          isFullScreenWidth == true ? MediaQuery.of(context).size.width : null,
      margin: EdgeInsets.symmetric(
        horizontal: marginHorizontal,
        vertical: marginVertical,
      ),
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: onTap ?? () {},
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).cardColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
