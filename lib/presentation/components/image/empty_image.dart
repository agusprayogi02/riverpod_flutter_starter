import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyImage extends StatelessWidget {
  const EmptyImage({
    super.key,
    this.height,
    this.width,
    this.child,
    this.isCircle = false,
  });

  final double? width, height;
  final Widget? child;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? width ?? 50,
      width: width ?? height ?? 50,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(
          isCircle ? height ?? width ?? 50 : 10,
        ),
        border: Border.all(color: Colors.grey[200]!, width: 1),
      ),
      child: child ?? const Center(child: Icon(CupertinoIcons.photo, color: Colors.grey)),
    );
  }
}
