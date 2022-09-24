import 'dart:math';
import 'package:flutter/material.dart';

class CustomScrollviewAppBar extends StatelessWidget {
  const CustomScrollviewAppBar({
    Key? key,
    required this.offset,
  }) : super(key: key);

  final double offset;

  @override
  Widget build(BuildContext context) {
    /// Here we leverage the maxExtent and minExtent properties
    /// of SliverAppBar to define the bounds between which
    /// the SliverAppBar will be animated during scrolling.

    const double maxExtent = 300;
    const double minExtent = 100;

    final double shrinkOffset = offset;

    final expendPercentage =
        1.0 - min(1, shrinkOffset / (maxExtent - minExtent));

    return Container(
      height: minExtent + (maxExtent - minExtent) * expendPercentage,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/010189447d1cde0d9695f16cb5206643b26e595293_pz0s1t.jpg"),
              fit: BoxFit.cover)),
    );
  }
}