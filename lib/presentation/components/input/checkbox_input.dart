import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:starter/common/extensions/extensions.dart';
import 'package:starter/presentation/themes/theme.dart';

class CheckboxInput extends StatelessWidget {
  const CheckboxInput({
    super.key,
    required this.title,
    this.widgetTitle,
    this.formControl,
    this.controlAffinity = ListTileControlAffinity.leading,
  });

  final String title;
  final Widget? widgetTitle;
  final FormControl<bool>? formControl;
  final ListTileControlAffinity controlAffinity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        formControl?.value = !(formControl?.value ?? false);
      },
      child: Row(
        spacing: 8.r,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (controlAffinity == ListTileControlAffinity.leading)
            ReactiveCheckbox(formControl: formControl).sized(h: 28, w: 28),
          widgetTitle != null
              ? widgetTitle!
              : Text(
                  title,
                  style: AppStyles.text14PxMedium.copyWith(
                    color: ColorTheme.grey[900],
                  ),
                ).expand(),
          if (controlAffinity == ListTileControlAffinity.trailing)
            ReactiveCheckbox(formControl: formControl).sized(h: 28, w: 28),
        ],
      ),
    );
  }
}
