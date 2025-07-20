import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../common/constants.dart';
import '../../themes/theme.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    super.key,
    required this.title,
    required this.formControlName,
    required this.hint,
    this.isRequiredText = false,
    this.prefix,
    this.validationMessages = const {},
    this.rounded = false,
  });

  final String title;
  final String formControlName;
  final String hint;
  final bool isRequiredText;
  final bool rounded;
  final Widget? prefix;
  final Map<String, String Function(Object)> validationMessages;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool showPassword = false;

  final Map<String, String Function(Object)> messages = Constants.messageErrors;
  late final double borderRadius;

  @override
  void initState() {
    super.initState();
    messages.addAll({
      ValidationMessage.required: (_) => 'inputan ini tidak boleh kosong',
      ValidationMessage.minLength: (_) => 'inputan password kurang dari 8 karakter',
      ValidationMessage.mustMatch: (_) => 'inputan password tidak sama',
      'validation_error': (e) => (e as String),
    });
    messages.addAll(widget.validationMessages);
    borderRadius = widget.rounded ? 40 : 12;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: widget.title),
              if (widget.isRequiredText)
                TextSpan(
                  text: "*",
                  style: AppStyles.text14PxMedium.copyWith(
                    color: ColorTheme.statusRed,
                  ),
                ),
            ],
          ),
          style: AppStyles.text14PxMedium.copyWith(color: ColorTheme.grey[900]),
        ),
        (widget.rounded ? 8 : 14).verticalSpacingRadius,
        ReactiveTextField(
          formControlName: widget.formControlName,
          obscureText: !showPassword,
          style: AppStyles.text14PxMedium.copyWith(
            color: ColorTheme.grey[800],
          ),
          keyboardType: TextInputType.visiblePassword,
          validationMessages: messages,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 14.r),
            fillColor: Colors.white,
            filled: true,
            hintText: widget.hint,
            prefixIcon: widget.prefix,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: showPassword
                  ? Icon(
                      Icons.visibility_off,
                      color: ColorTheme.grey[500],
                      size: 20.r,
                    )
                  : Icon(
                      Icons.visibility,
                      color: ColorTheme.grey[500],
                      size: 20.r,
                    ),
            ),
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
        ),
      ],
    );
  }
}
