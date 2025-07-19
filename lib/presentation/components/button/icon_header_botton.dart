import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:starter/presentation/themes/theme.dart';

class IconHeaderButton extends StatelessWidget {
  const IconHeaderButton({
    super.key,
    this.iconSrc,
    this.icon,
    this.onPressed,
    this.badgeCount,
  });

  final String? iconSrc;
  final IconData? icon;
  final int? badgeCount;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
        iconSize: 24.r,
        foregroundColor: ColorTheme.primary,
      ),
      icon: Badge(
        isLabelVisible: badgeCount != null && badgeCount! > 0,
        label: Text(badgeCount.toString()),
        backgroundColor: ColorTheme.error,
        child: icon != null
            ? Icon(icon ?? IconsaxPlusLinear.home)
            : SvgPicture.asset(
                iconSrc ?? "assets/icons/chat-round.svg",
                width: 24.r,
              ),
      ),
    );
  }
}
