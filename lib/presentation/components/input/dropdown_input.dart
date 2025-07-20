import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../common/constants.dart';
import '../../themes/theme.dart';

class DropdownInput<T extends Object> extends StatelessWidget {
  const DropdownInput({
    super.key,
    this.title,
    this.noTitle = false,
    this.formControlName,
    required this.hint,
    required this.items,
    this.isRequiredText = false,
    this.onChanged,
    this.readOnly = false,
    this.validationMessages = const {},
    this.formControl,
    this.rounded = false,
    this.prefix,
    this.suffix,
  });

  final String? title;
  final bool noTitle;
  final String? formControlName;
  final String hint;

  /// format for items
  /// [ {"text": "","value": T} ]
  final List<Map<String, dynamic>> items;
  final bool isRequiredText;
  final Function(FormControl<T?>?)? onChanged;
  final bool readOnly;
  final Map<String, String Function(Object)> validationMessages;
  final FormControl<T>? formControl;
  final bool rounded;
  final Widget? prefix;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    final double borderRadius = rounded ? 40 : 12;
    final Map<String, String Function(Object)> messages = Constants.messageErrors;
    messages.addAll(validationMessages);
    final input = ReactiveDropdownField<T>(
      items: items
          .map(
            (e) => DropdownMenuItem<T>(
              value: e['value'],
              child: Text(e['text'] ?? '-', style: CustomTextTheme.paragraph1),
            ),
          )
          .toList(),
      formControl: formControlName != null ? null : formControl,
      style: AppStyles.text14Px.copyWith(color: ColorTheme.grey[800]),
      dropdownColor: ColorTheme.white,
      formControlName: formControlName,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 10.r),
        fillColor: Colors.white,
        filled: true,
        hintText: hint,
        prefixIcon: prefix,
        suffixIcon: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: AppCoreTheme.primaryColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: AppCoreTheme.primaryColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: ColorTheme.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: ColorTheme.error, width: 1),
        ),
        hintStyle: AppStyles.text14Px.copyWith(color: ColorTheme.grey[400]),
        errorStyle: AppStyles.text14Px.copyWith(color: ColorTheme.error),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: ColorTheme.grey[200]!, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: ColorTheme.grey[300]!, width: 1),
        ),
      ),
      onChanged: onChanged,
      readOnly: readOnly,
      validationMessages: messages,
      isExpanded: true,
    );
    if (noTitle) {
      return input;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.r,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: title ?? hint),
              if (isRequiredText)
                TextSpan(
                  text: "*",
                  style: AppStyles.text14PxMedium.copyWith(
                    color: ColorTheme.error,
                  ),
                ),
            ],
          ),
          style: AppStyles.text14PxMedium.copyWith(color: ColorTheme.grey[900]),
        ),
        input,
      ],
    );
  }
}
