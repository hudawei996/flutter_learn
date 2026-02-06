import 'package:flutter/material.dart';

class SlidingBoxMy extends StatelessWidget {
  // 这里就是要被外部使用的，所以不要用下划线
  final AnimationController controller;
  final Color? color;
  final Curve curve;

  const SlidingBoxMy({
    super.key,
    required this.controller,
    required this.color,
    required this.curve,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: controller.drive(
        Tween(
          begin: const Offset(0.0, 0.0),
          end: const Offset(1.0, 0.0),
        ).chain(CurveTween(curve: curve)),
      ),

      child: Container(width: 120, height: 60, color: color),
    );
  }
}
