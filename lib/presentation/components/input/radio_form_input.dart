import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:starter/presentation/components/input/radio_input.dart';
import 'package:starter/presentation/themes/theme.dart';

class RadioFormInput<T> extends StatefulWidget {
  const RadioFormInput({
    super.key,
    required this.title,
    required this.formControl,
    this.isRequiredText = false,
    required this.items,
  });

  final String title;
  final FormControl<T>? formControl;
  final bool isRequiredText;
  final List<Map<String, dynamic>> items;

  @override
  State<RadioFormInput> createState() => _RadioFormInputState();
}

class _RadioFormInputState extends State<RadioFormInput> {
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
        ...List.generate(widget.items.length, (index) {
          final item = widget.items[index];
          return RadioInput(
            title: item['name'],
            formControl: widget.formControl,
            value: item['value'],
            controlAffinity: ListTileControlAffinity.leading,
          );
        }),
      ],
    );
  }
}
