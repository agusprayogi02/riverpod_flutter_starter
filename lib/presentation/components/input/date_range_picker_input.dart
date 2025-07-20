import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_date_range_picker/reactive_date_range_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:starter/common/constants.dart';
import 'package:starter/presentation/themes/theme.dart';

class DateRangePickerInput extends StatefulWidget {
  const DateRangePickerInput({
    super.key,
    this.formControl,
    required this.title,
    this.formControlName,
    required this.hint,
    this.textInputType = TextInputType.text,
    this.isRequiredText = false,
    this.validationMessages = const {},
    this.prefix,
    this.suffix,
    this.rounded = false,
    this.noTitle = false,
    this.readOnly,
    this.onTap,
  });

  final String title;
  final bool noTitle;
  final bool rounded;
  final String? formControlName;
  final FormControl<DateTimeRange>? formControl;
  final String hint;
  final TextInputType textInputType;
  final bool isRequiredText;
  final Map<String, String Function(Object)> validationMessages;
  final Widget? prefix;
  final Widget? suffix;
  final bool? readOnly;
  final Function(FormControl<Object?>)? onTap;

  @override
  State<DateRangePickerInput> createState() => _DateRangePickerInputState();
}

class _DateRangePickerInputState extends State<DateRangePickerInput> {
  final Map<String, String Function(Object)> messages = Constants.messageErrors;
  late final double borderRadius;

  @override
  void initState() {
    super.initState();
    messages.addAll(widget.validationMessages);
    borderRadius = widget.rounded ? 40 : 12;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!widget.noTitle) ...[
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: widget.title),
                if (widget.isRequiredText)
                  TextSpan(
                    text: "*",
                    style: AppStyles.text14PxMedium.copyWith(
                      color: ColorTheme.error,
                    ),
                  ),
              ],
            ),
            style: AppStyles.text14PxMedium.copyWith(
              color: ColorTheme.grey[900],
            ),
          ),
          (widget.rounded ? 8 : 14).verticalSpacingRadius,
        ],
        ReactiveDateRangePicker(
          formControl: widget.formControl,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.r,
              vertical: 12.r,
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: widget.hint,
            prefixIcon: widget.prefix,
            suffixIcon: widget.suffix,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: AppCoreTheme.primaryColor, width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: ColorTheme.grey[200]!, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: ColorTheme.grey[300]!, width: 1),
            ),
          ),
          validationMessages: messages,
        ),
      ],
    );
  }
}
