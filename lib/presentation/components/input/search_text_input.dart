import 'package:debouncer_widget/debouncer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:starter/common/extensions/extensions.dart';
import 'package:starter/presentation/themes/theme.dart';

class SearchTextInput extends StatelessWidget {
  const SearchTextInput({
    super.key,
    required this.hint,
    this.onFilter,
    this.onTap,
    this.onChanged,
    this.autofocus = false,
  });

  final String hint;
  final VoidCallback? onFilter;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final c = TextEditingController();
    return Row(
      children: [
        Debouncer(
          action: () {
            onChanged?.call(c.text);
          },
          builder: (context, value) {
            return TextField(
              autofocus: autofocus,
              controller: c,
              decoration: GenerateTheme.inputDecorationRounded(hint).copyWith(
                prefixIcon: Icon(IconsaxPlusLinear.search_normal, size: 24.r),
              ),
              onTap: onTap,
              onChanged: (_) => Debouncer.execute(context),
            ).expand();
          },
        ),
        if (onFilter != null) ...[
          8.horizontalSpace,
          InkWell(
            onTap: onFilter,
            child: Icon(IconsaxPlusLinear.sort, size: 30.r),
          ),
        ],
      ],
    );
  }
}
