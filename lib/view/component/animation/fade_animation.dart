import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';

class FadeAnimation extends StatelessWidget {
  final int delay;
  final Widget child;
  const FadeAnimation({super.key, required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: 50.0, end: 200.0), // set tween
      duration: Duration(seconds: delay), // set duration
      builder: (context, value, _) {
        return child;
      },
    );
  }
}