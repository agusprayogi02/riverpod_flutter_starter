import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:starter/presentation/components/base/base_scaffold.dart';
import 'package:starter/presentation/components/button/back_round_button.dart';
import 'package:starter/presentation/components/button/primary_button.dart';

import '../../../../common/extensions/extensions.dart';
import '../../../components/input/text_input.dart';
import '../../../themes/theme.dart';

part 'forgot_password_controller.dart';

class ForgotPasswordPage extends HookConsumerWidget {
  const ForgotPasswordPage({super.key});

  static const path = "/forgot-password";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = ForgotPasswordController(context: context);
    return BaseScaffold(
      body: ReactiveFormBuilder(
        form: () => c.form,
        builder: (context, formG, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackRoundButton(
                icon: Icons.arrow_back_ios_new_rounded,
                size: 36,
                onTap: c.goBack,
              ),
              20.verticalSpacingRadius,
              Text(
                'Forgot Password',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.text16PxBold.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Enter your email and we will send you a verification code to reset your password',
                style: AppStyles.text12Px.copyWith(
                  color: ColorTheme.grey[600],
                ),
              ),
              20.verticalSpacingRadius,
              const TextInput(
                formControlName: 'email',
                hint: 'Enter your email',
                title: "Email",
                isRequiredText: true,
                prefix: Icon(Icons.email_outlined),
                textInputType: TextInputType.emailAddress,
                rounded: true,
              ),
              const Spacer(),
              ReactiveFormConsumer(
                builder: (context, formState, child) {
                  return PrimaryButton(
                    title: "Submit",
                    onTap: () => c.onSubmit(formG),
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
