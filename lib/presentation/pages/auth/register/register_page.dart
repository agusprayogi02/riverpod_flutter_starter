import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:starter/presentation/components/base/base_scaffold.dart';
import 'package:starter/presentation/components/button/primary_button.dart';
import 'package:starter/presentation/components/input/password_input.dart';
import 'package:starter/presentation/pages/auth/login/login_page.dart';
import 'package:starter/presentation/themes/theme.dart';

import '../../../../common/extensions/extensions.dart';
import '../../../components/input/text_input.dart';

part 'register_controller.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  static const path = "/register";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = RegisterController(context);
    return ReactiveFormBuilder(
      form: () => c.formG,
      builder: (context, form, child) => BaseScaffold(
        backgroundColor: ColorTheme.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.verticalSpacingRadius,
              Text(
                'Get Started',
                overflow: TextOverflow.ellipsis,
                style: AppStyles.text24PxSemiBold.copyWith(color: ColorTheme.black),
              ),
              4.verticalSpacingRadius,
              Text(
                'Create your new account',
                style: AppStyles.text12Px.copyWith(color: ColorTheme.black),
              ),
              58.verticalSpacingRadius,
              const TextInput(
                prefix: Icon(Icons.person),
                rounded: true,
                title: "Full Name",
                formControlName: "name",
                hint: 'Enter Full Name',
                isRequiredText: true,
              ),
              16.verticalSpacingRadius,
              const TextInput(
                prefix: Icon(Icons.email),
                rounded: true,
                title: "Email",
                formControlName: "email",
                hint: 'Enter Email',
                textInputType: TextInputType.emailAddress,
                isRequiredText: true,
              ),
              16.verticalSpacingRadius,
              PasswordInput(
                rounded: true,
                formControlName: "password",
                title: "Password",
                hint: "Enter Password",
                isRequiredText: true,
                prefix: const Icon(Icons.key),
                validationMessages: c.passwordMessages,
              ),
              58.verticalSpacingRadius,
              ReactiveFormConsumer(
                builder: (context, formL, child) {
                  return PrimaryButton(
                    onTap: () => c.onSubmit(formL),
                    title: "Sign up",
                    isEnable: formL.valid,
                  );
                },
              ),
              32.verticalSpacingRadius,
              // Row(
              //   children: [
              //     Expanded(
              //       child: Divider(
              //         color: ColorTheme.grey[300],
              //         thickness: 1,
              //         indent: 24.r,
              //         endIndent: 8.r,
              //       ),
              //     ),
              //     Text(
              //       "Or Sign in with",
              //       style: AppStyles.text14PxMedium.copyWith(color: ColorTheme.grey[300]),
              //     ),
              //     Expanded(
              //       child: Divider(
              //         color: ColorTheme.grey[300],
              //         thickness: 1,
              //         indent: 24.r,
              //         endIndent: 8.r,
              //       ),
              //     ),
              //   ],
              // ),
              68.verticalSpacingRadius,
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    text: "Have an account? ",
                    style: AppStyles.text14Px.copyWith(color: ColorTheme.black),
                    children: [
                      TextSpan(
                        text: "Sign in here",
                        style: AppStyles.text14PxBold.copyWith(color: ColorTheme.primary),
                        recognizer: TapGestureRecognizer()..onTap = c.onLogin,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
