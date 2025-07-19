import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/extensions/context_extension.dart';
import '../../themes/theme.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool isBack;
  final bool automaticallyImplyLeading;
  final bool centerTitle;
  final VoidCallback? onBack;

  const BaseAppBar({
    super.key,
    required this.title,
    this.actions,
    this.isBack = false,
    this.automaticallyImplyLeading = true,
    this.centerTitle = false,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppStyles.text16PxSemiBold.copyWith(
          color: ColorTheme.grey.shade900,
        ),
      ),
      leading: isBack
          ? InkWell(
              onTap: onBack ??
                  () {
                    context.route.pop();
                  },
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: ColorTheme.grey.shade900,
                size: 24.r,
              ),
            )
          : null,
      centerTitle: centerTitle,
      backgroundColor: ColorTheme.white,
      elevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
