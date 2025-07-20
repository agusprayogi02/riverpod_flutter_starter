import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:starter/common/constants.dart';
import 'package:starter/common/extensions/extensions.dart';
import 'package:starter/presentation/components/box/dashed_border_box.dart';
import 'package:starter/presentation/components/image/image_with_loader.dart';
import 'package:starter/presentation/themes/theme.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({
    super.key,
    required this.title,
    required this.formControlName,
    required this.hint,
    required this.hintIcon,
    this.isRequiredText = false,
    this.validationMessages = const {},
    this.maxLines = 1,
    this.prefix,
    this.suffix,
    this.onChanged,
    this.onTap,
    this.pathImage,
  });

  final String title;
  final String formControlName;
  final String hint;
  final IconData hintIcon;
  final bool isRequiredText;
  final Map<String, String Function(Object)> validationMessages;
  final int maxLines;
  final Widget? prefix;
  final Widget? suffix;
  final Function(FormControl<Object?>)? onChanged;
  final VoidCallback? onTap;
  final String? pathImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  final Map<String, String Function(Object)> messages = Constants.messageErrors;

  @override
  void initState() {
    super.initState();
    messages.addAll(widget.validationMessages);
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
        14.verticalSpacingRadius,
        InkWell(
          onTap: widget.onTap,
          child: widget.pathImage != null
              ? ImageWithLoader(
                  imageUrl: widget.pathImage ?? '',
                  isFile: !widget.pathImage.isUrl,
                  width: double.infinity,
                  height: 101.r,
                  fit: BoxFit.fitWidth,
                  radius: 8.r,
                )
              : DashedBorderBox(
                  color: AppCoreTheme.primaryColor,
                  child: Container(
                    width: double.infinity,
                    height: 101.r,
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          widget.hintIcon,
                          size: 16.r,
                          color: AppCoreTheme.primaryColor,
                        ),
                        8.horizontalSpaceRadius,
                        Text(
                          widget.hint,
                          style: AppStyles.text12PxSemiBold.copyWith(
                            color: AppCoreTheme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
