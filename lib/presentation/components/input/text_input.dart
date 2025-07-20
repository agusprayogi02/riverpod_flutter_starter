import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../common/constants.dart';
import '../../themes/theme.dart';

class TextInput<T> extends StatefulWidget {
  const TextInput({
    super.key,
    this.title,
    required this.hint,
    this.formControlName,
    this.textInputType = TextInputType.text,
    this.isRequiredText = false,
    this.validationMessages = const {},
    this.maxLines = 1,
    this.prefix,
    this.suffix,
    this.onChanged,
    this.rounded = false,
    this.noTitle = false,
    this.readOnly,
    this.onTap,
    this.formControl,
    this.inputFormatters,
    this.valueAccessor,
  });

  final String? title;
  final bool noTitle;
  final bool rounded;
  final String? formControlName;
  final FormControl<T>? formControl;
  final String hint;
  final TextInputType textInputType;
  final bool isRequiredText;
  final Map<String, String Function(Object)> validationMessages;
  final int maxLines;
  final Widget? prefix;
  final Widget? suffix;
  final Function(FormControl<Object?>)? onChanged;
  final bool? readOnly;
  final Function(FormControl<Object?>)? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final ControlValueAccessor<T, String>? valueAccessor;
  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
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
    final input = ReactiveTextField(
      valueAccessor: widget.valueAccessor,
      onTap: widget.onTap,
      readOnly: widget.readOnly ?? false,
      keyboardType: widget.textInputType,
      formControlName: widget.formControlName,
      formControl: widget.formControl,
      inputFormatters: widget.inputFormatters,
      style: AppStyles.text14Px.copyWith(color: ColorTheme.grey[800]),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 14.r),
        fillColor: Colors.white,
        filled: true,
        hintText: widget.hint,
        prefixIcon: widget.prefix,
        suffixIcon: widget.suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: AppCoreTheme.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: AppCoreTheme.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: ColorTheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: ColorTheme.error),
        ),
        hintStyle: AppStyles.text14Px.copyWith(color: ColorTheme.grey[400]),
        errorStyle: AppStyles.text14Px.copyWith(color: ColorTheme.error),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: ColorTheme.grey[200]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: ColorTheme.grey[300]!),
        ),
      ),
      validationMessages: messages,
      maxLines: widget.maxLines,
      onChanged: widget.onChanged,
    );
    if (widget.noTitle) {
      return input;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.r,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: widget.title ?? widget.hint),
              if (widget.isRequiredText)
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
