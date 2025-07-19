import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.onTap,
    this.isEnable = true,
    this.isSmall = false,
    this.width,
    this.isFullWidth = true,
    this.backgroundColor = ColorTheme.primary,
    this.color,
  });

  final String title;
  final VoidCallback? onTap;
  final bool isEnable;
  final bool isSmall;
  final bool isFullWidth;
  final double? width;
  final Color backgroundColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isEnable) onTap!();
      },
      child: Container(
        height: (isSmall ? 38 : 48).r,
        width: isFullWidth ? double.infinity : width,
        decoration: BoxDecoration(
          color: isEnable ? backgroundColor : ColorTheme.grey[200],
          borderRadius: BorderRadius.circular(isSmall ? 34 : 49),
        ),
        child: Center(
          child: Text(
            title,
            style: isSmall
                ? CustomTextTheme.caption.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isEnable ? color ?? Colors.white : ColorTheme.grey[500],
                  )
                : CustomTextTheme.paragraph1.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isEnable ? color ?? Colors.white : ColorTheme.grey[500],
                  ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
