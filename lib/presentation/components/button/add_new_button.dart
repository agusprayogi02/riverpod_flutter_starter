import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:starter/common/extensions/extensions.dart';
import 'package:starter/presentation/themes/theme.dart';

class AddNewButton extends HookConsumerWidget {
  const AddNewButton({
    super.key,
    required this.title,
    this.onTap,
    this.color,
    this.isLoading = false,
  });

  final String title;
  final VoidCallback? onTap;
  final Color? color;
  final bool isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: 40.r,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: 8.rounded,
          border: Border.all(color: AppCoreTheme.primaryColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              IconsaxPlusLinear.add,
              size: 24.r,
              color: color ?? AppCoreTheme.primaryColor,
            ),
            8.horizontalSpaceRadius,
            Text(
              title,
              style: AppStyles.text14PxBold.copyWith(
                color: color ?? AppCoreTheme.primaryColor,
              ),
            ),
          ],
        ),
      ),
    ).shimmer(enabled: isLoading, isText: true);
  }
}
