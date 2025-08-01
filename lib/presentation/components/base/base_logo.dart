import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter/gen/assets.gen.dart';

class BaseLogo extends StatelessWidget {
  const BaseLogo({
    super.key,
    this.isSmall = false,
  });

  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return Assets.images.launcher.image(
      height: isSmall ? null : 100.h,
      width: isSmall ? 68.w : null,
      fit: BoxFit.cover,
    );
  }
}
