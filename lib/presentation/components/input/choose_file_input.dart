import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:reactive_forms/reactive_forms.dart';
import 'package:starter/common/constants.dart';
import 'package:starter/common/extensions/extensions.dart';
import 'package:starter/common/storage/storage.dart';
import 'package:starter/presentation/themes/theme.dart';

class ChooseFileInput extends HookConsumerWidget {
  const ChooseFileInput({
    super.key,
    required this.title,
    required this.formControl,
    required this.maxSizeHint,
    required this.supported,
    this.isRequiredText = false,
  });

  final String title;
  final FormControl<String>? formControl;
  final String maxSizeHint;
  final List<String> supported;
  final bool isRequiredText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storage = ref.read(storageInterfaceProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: title),
              if (isRequiredText)
                TextSpan(
                  text: "*",
                  style: AppStyles.text14PxMedium.copyWith(color: ColorTheme.statusRed),
                ),
            ],
          ),
          style: AppStyles.text14PxMedium.copyWith(color: ColorTheme.grey[900]),
        ),
        8.verticalSpacingRadius,
        InkWell(
          onTap: () async {
            final pick = await storage.pickFile(extensions: supported);
            if (pick != null) {
              formControl?.value = pick.path;
            }
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: const Color(0xFFEAECF0)),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: ReactiveFormConsumer(
              builder: (context, form, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8.r,
                  children: [
                    if (formControl?.value == null)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 12.r,
                        children: [
                          Text(
                            'Upload File',
                            style: AppStyles.text11PxMedium.copyWith(color: ColorTheme.blue),
                          ),
                          SvgPicture.asset(
                            ImageAssetConst.uploadSvg,
                            width: 16.r,
                            height: 16.r,
                            clipBehavior: Clip.antiAlias,
                          ),
                        ],
                      ),
                    if (formControl?.value != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8).r,
                        decoration: BoxDecoration(
                          color: ColorTheme.grey.shade100,
                          borderRadius: 12.rounded,
                        ),
                        child: Row(
                          spacing: 8.r,
                          children: [
                            Text(p.basename(formControl?.value ?? '')).expand(),
                            InkWell(
                              onTap: () {
                                formControl?.value = null;
                              },
                              child: Icon(Icons.delete, color: ColorTheme.statusRed, size: 18.r),
                            ),
                          ],
                        ),
                      ),
                    SizedBox(
                      width: 311.r,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Maximum file size: ',
                                  style: AppStyles.text10Px.copyWith(
                                    color: ColorTheme.grey.shade400,
                                  ),
                                ),
                                TextSpan(
                                  text: maxSizeHint,
                                  style: AppStyles.text10Px.copyWith(color: ColorTheme.grey),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 311,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Supported file: ',
                                    style: AppStyles.text10Px.copyWith(
                                      color: ColorTheme.grey.shade400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: supported.join(', ').toUpperCase(),
                                    style: AppStyles.text10Px.copyWith(
                                      color: ColorTheme.grey,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
