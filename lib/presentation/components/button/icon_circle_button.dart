import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:starter/presentation/themes/theme.dart';

class IconCircleButton extends StatelessWidget {
  const IconCircleButton({
    super.key,
    required this.svgIcon,
    this.backgroundColor,
    this.onTap,
  });

  final String svgIcon;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: IconButton.styleFrom(
        foregroundColor: ColorTheme.white,
        backgroundColor: backgroundColor ?? ColorTheme.grey.shade200,
        fixedSize: Size(40.r, 40.r),
      ),
      icon: SvgPicture.asset(svgIcon, width: 18.r),
      onPressed: onTap,
    );
  }
}
