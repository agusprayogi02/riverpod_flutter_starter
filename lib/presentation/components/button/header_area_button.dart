import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:starter/common/extensions/extensions.dart';
import 'package:starter/presentation/themes/theme.dart';

class HeaderAreaButton extends HookConsumerWidget {
  const HeaderAreaButton({super.key, this.onShare, this.onHide, this.onReport});

  final VoidCallback? onShare;
  final VoidCallback? onHide;
  final VoidCallback? onReport;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton.filled(
          style: ButtonStyles.iconFilledBlur,
          icon: Icon(IconsaxPlusLinear.arrow_left, size: 18.r),
          onPressed: () {
            context.route.pop();
          },
        ),
        const Spacer(),
        IconButton.filled(
          style: ButtonStyles.iconFilledBlur,
          icon: SvgPicture.asset("assets/icons/share.svg", width: 18.r),
          onPressed: onShare,
        ),
        12.horizontalSpaceRadius,
        PopupMenuButton(
          offset: Offset.fromDirection(1.5, 40.r),
          onSelected: (value) {
            switch (value) {
              case "hide":
                onHide?.call();
                break;
              case "report":
                onReport?.call();
                break;
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: "hide",
              child: Row(
                spacing: 6.r,
                children: [
                  Icon(
                    IconsaxPlusLinear.eye_slash,
                    color: ColorTheme.black,
                    size: 24.r,
                  ),
                  const Text("Hide IP"),
                ],
              ),
            ),
            PopupMenuItem(
              value: "report",
              child: Row(
                spacing: 6.r,
                children: [
                  Icon(
                    IconsaxPlusLinear.warning_2,
                    color: ColorTheme.error,
                    size: 24.r,
                  ),
                  const Text(
                    "Report",
                    style: TextStyle(color: ColorTheme.error),
                  ),
                ],
              ),
            ),
          ],
          child: Container(
            height: 36.r,
            width: 36.r,
            decoration: BoxDecoration(
              color: ColorTheme.black.withAlpha(100),
              borderRadius: 32.rounded,
            ),
            child: Icon(Icons.more_vert, size: 18.r, color: ColorTheme.white),
          ),
        ),
      ],
    );
  }
}
