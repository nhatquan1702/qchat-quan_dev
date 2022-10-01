import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

class CustomScrollviewAppBar extends StatelessWidget {
  final double offset;
  final VoidCallback onTap;
  final File? file;

  const CustomScrollviewAppBar({
    super.key,
    required this.offset,
    required this.onTap,
    this.file,
  });

  @override
  Widget build(BuildContext context) {
    /// Here we leverage the maxExtent and minExtent properties
    /// of SliverAppBar to define the bounds between which
    /// the SliverAppBar will be animated during scrolling.

    const double maxExtent = 300;
    const double minExtent = 100;
    final appColor = Theme.of(context);

    final double shrinkOffset = offset;

    final expendPercentage =
        1.0 - min(1, shrinkOffset / (maxExtent - minExtent));

    return InkWell(
        onTap: onTap,
        child: file == null
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: minExtent + (maxExtent - minExtent) * expendPercentage,
                color: appColor.canvasColor.withOpacity(0.1),
                child: Icon(
                  Icons.add_a_photo_outlined,
                  color: appColor.canvasColor,
                ),
              )
            : Container(
                height: minExtent + (maxExtent - minExtent) * expendPercentage,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(file!),
                    fit: BoxFit.cover,
                  ),
                ),
              ));
  }
}
