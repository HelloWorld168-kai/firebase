import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double width;
  final Color color;
  final double borderRadius;
  final Widget? child;

  const CustomContainer({
    super.key,
    this.width = 100,
    this.color = const Color(0xFF012032),
    this.borderRadius = 15.0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
      ),
      child: child,
    );
  }
}
