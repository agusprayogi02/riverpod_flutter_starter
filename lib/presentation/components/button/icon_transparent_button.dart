import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter/presentation/themes/theme.dart';

class IconTransparentButton extends HookConsumerWidget {
  const IconTransparentButton({
    super.key,
    required this.icon,
    this.onTap,
    this.color,
    this.size,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: Icon(icon, size: (size ?? 24).r, color: color ?? ColorTheme.white),
    );
  }
}
