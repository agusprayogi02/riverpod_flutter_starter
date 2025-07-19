import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:starter/common/extensions/extensions.dart';
import 'package:starter/presentation/themes/theme.dart';

class FooterActionButton extends HookConsumerWidget {
  const FooterActionButton({
    super.key,
    this.onLike,
    this.onComment,
    this.onShare,
    this.isLiked = false,
    this.likeCount,
    this.commentCount,
    this.shareCount,
  });

  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onShare;
  final bool isLiked;
  final int? likeCount;
  final int? commentCount;
  final int? shareCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        InkWell(
          onTap: onLike,
          child: Row(
            children: [
              Icon(
                isLiked ? IconsaxPlusBold.like_1 : IconsaxPlusLinear.like_1,
                size: 24.r,
                color: isLiked ? ColorTheme.primary : ColorTheme.grey.shade400,
              ),
              4.horizontalSpace,
              Text(
                '${likeCount ?? 2.5}',
                style: AppStyles.text14PxSemiBold.copyWith(
                  color: isLiked ? ColorTheme.primary : ColorTheme.grey.shade500,
                ),
              ),
            ],
          ).shimmer(enabled: onLike == null, isText: true),
        ),
        12.horizontalSpace,
        InkWell(
          onTap: onComment,
          child: Row(
            children: [
              SvgPicture.asset("assets/icons/chat.svg", width: 24.r),
              4.horizontalSpace,
              Text(
                '${commentCount ?? 1.6}',
                style: AppStyles.text14PxSemiBold.copyWith(
                  color: ColorTheme.grey.shade500,
                ),
              ),
            ],
          ),
        ),
        12.horizontalSpace,
        const Spacer(),
        InkWell(
          onTap: onShare,
          child: Row(
            children: [
              Icon(
                IconsaxPlusLinear.send_2,
                size: 24.r,
                color: ColorTheme.grey.shade400,
              ),
              4.horizontalSpace,
              Text(
                '${shareCount ?? 980}',
                style: AppStyles.text14PxSemiBold.copyWith(
                  color: ColorTheme.grey.shade500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
