import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter/common/extensions/extensions.dart';
import 'package:starter/presentation/themes/theme.dart';

class SocialMediaButton extends HookConsumerWidget {
  const SocialMediaButton({super.key, this.onTap, required this.title});

  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: 10.all,
        decoration: ShapeDecoration(
          color: ColorTheme.grey[100],
          shape: const OvalBorder(),
        ),
        child: Image.asset(
          "assets/icons/social-media/$title.png",
          width: 24.r,
          height: 24.r,
        ),
      ),
    );
  }
}
