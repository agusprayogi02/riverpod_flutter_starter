import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_pinput/reactive_pinput.dart';
import 'package:starter/common/extensions/extensions.dart';
import 'package:starter/data/datasources/locals/developer_source.dart';
import 'package:starter/presentation/components/base/base_app_bar.dart';
import 'package:starter/presentation/components/base/base_scaffold.dart';
import 'package:starter/presentation/components/button/primary_button.dart';
import 'package:starter/presentation/pages/general/on_boarding/on_boarding_page.dart';
import 'package:starter/presentation/pages/general/setting_mode/setting_mode_page.dart';
import 'package:starter/presentation/themes/theme.dart';

part 'dev_mode_controller.dart';

class DevModePage extends HookConsumerWidget {
  static String path = "/dev-mode";

  const DevModePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = DevModeController(0);
    return BaseScaffold(
      appBar: BaseAppBar(
        title: "Developer Mode",
        onBack: () => context.route.goNamed(OnBoardingPage.path),
        isBack: true,
      ),
      body: ReactiveFormBuilder(
        form: () => c.formG,
        builder: (context, formG, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.verticalSpacingRadius,
              Text(
                'Input pin to enter staging mode',
                style: AppStyles.text16Px.copyWith(color: ColorTheme.grey[600]),
              ),
              45.verticalSpacingRadius,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReactivePinPut(
                    autofocus: true,
                    formControlName: 'code',
                    length: 6,
                    defaultPinTheme: PinTheme(
                      textStyle: AppStyles.text20Px.copyWith(
                        color: ColorTheme.grey[800],
                      ),
                      margin: 4.all,
                      padding: 12.all,
                      constraints: BoxConstraints.expand(
                        height: 50.r,
                        width: 40.r,
                      ),
                      decoration: BoxDecoration(
                        color: ColorTheme.white,
                        borderRadius: 8.rounded,
                        border: Border.all(color: ColorTheme.grey[300]!),
                      ),
                    ),
                  ),
                ],
              ),
              75.verticalSpacingRadius,
              ReactiveFormConsumer(
                builder: (context, formState, child) {
                  return PrimaryButton(
                    title: "Submit",
                    onTap: () => c.submit(formState, context, ref),
                    isEnable: formState.valid,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
