import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:starter/common/extensions/extensions.dart';
import 'package:starter/presentation/themes/theme.dart';

class SwitchInput extends StatelessWidget {
  const SwitchInput({
    super.key,
    this.title = '',
    this.widgetTitle,
    this.formControl,
    this.onChanged,
    this.controlAffinity = ListTileControlAffinity.trailing,
  });

  final String title;
  final Widget? widgetTitle;
  final FormControl<bool>? formControl;
  final ReactiveFormFieldCallback<bool>? onChanged;
  final ListTileControlAffinity controlAffinity;

  @override
  Widget build(BuildContext context) {
    final field = Theme(
      data: ThemeData(
        useMaterial3: false,
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith<Color>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return ColorTheme.grey.shade400.withAlpha(0x48);
            } else if (states.contains(WidgetState.selected)) {
              return ColorTheme.primary;
            }
            return ColorTheme.grey.shade400;
          }),
          trackColor: WidgetStateProperty.resolveWith<Color>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return ColorTheme.grey.shade200.withAlpha(0x48);
            } else if (states.contains(WidgetState.selected)) {
              return ColorTheme.grey.shade400;
            }
            return ColorTheme.grey.shade200;
          }),
        ),
      ),
      child: ReactiveSwitch.adaptive(
        formControl: formControl,
        onChanged: onChanged,
      ).sized(h: 24.r),
    );
    return InkWell(
      onTap: () {
        formControl?.value = !(formControl?.value ?? false);
        onChanged?.call(formControl!);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 8.r,
        children: [
          if (controlAffinity == ListTileControlAffinity.leading) field,
          widgetTitle != null
              ? widgetTitle!
              : Text(
                  title,
                  style: AppStyles.text14PxMedium.copyWith(
                    color: ColorTheme.primary,
                  ),
                ),
          if (controlAffinity == ListTileControlAffinity.trailing) field,
        ],
      ),
    );
  }
}
