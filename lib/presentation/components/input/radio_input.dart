import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:starter/common/extensions/extensions.dart';
import 'package:starter/presentation/themes/theme.dart';

class RadioInput<T> extends StatelessWidget {
  const RadioInput({
    super.key,
    this.title = '',
    this.widgetTitle,
    this.formControl,
    required this.value,
    this.controlAffinity = ListTileControlAffinity.leading,
  });

  final String title;
  final Widget? widgetTitle;
  final FormControl<T>? formControl;
  final T value;
  final ListTileControlAffinity controlAffinity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        formControl?.value = value;
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 8.r,
        children: [
          if (controlAffinity == ListTileControlAffinity.leading)
            ReactiveRadio<T>(
              formControl: formControl,
              value: value,
            ).sized(h: 28, w: 28.r),
          widgetTitle != null
              ? widgetTitle!
              : Text(
                  title,
                  style: AppStyles.text14PxMedium.copyWith(
                    color: ColorTheme.grey[900],
                  ),
                ).expand(),
          if (controlAffinity == ListTileControlAffinity.trailing)
            ReactiveRadio<T>(
              formControl: formControl,
              value: value,
            ).sized(h: 28, w: 28.r),
        ],
      ),
    );
  }
}
