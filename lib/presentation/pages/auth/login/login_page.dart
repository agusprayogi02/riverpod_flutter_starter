import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:starter/common/constants.dart';
import 'package:starter/data/datasources/locals/developer_source.dart';
import 'package:starter/data/entities/developer_entity.dart';
import 'package:starter/presentation/components/base/base_scaffold.dart';
import 'package:starter/presentation/components/button/primary_button.dart';
import 'package:starter/presentation/pages/auth/forgot_password/forgot_password_page.dart';
import 'package:starter/presentation/pages/auth/register/register_page.dart';

import '../../../../common/extensions/extensions.dart';
import '../../../components/input/password_input.dart';
import '../../../components/input/text_input.dart';
import '../../../themes/theme.dart';
import '../../general/dev_mode/dev_mode_page.dart';

part 'login_controller.dart';

class LoginPage extends HookConsumerWidget {
  final bool isAddAccount;
  static const path = "/login";

  const LoginPage({super.key, required this.isAddAccount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = LoginController(0, context: context, isAddAccount: isAddAccount);
    return ReactiveFormBuilder(
      form: () => c.form,
      builder: (context, form, child) => BaseScaffold(
        backgroundColor: ColorTheme.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.verticalSpacingRadius,
              Text(
                'Welcome back!',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.text24PxSemiBold.copyWith(
                  color: ColorTheme.black,
                ),
              ),
              Text(
                'Please Sign in to continue',
                style: AppStyles.text14Px.copyWith(color: ColorTheme.black),
              ),
              58.verticalSpacingRadius,
              const TextInput(
                title: "Email",
                formControlName: "email",
                hint: 'Enter Email',
                textInputType: TextInputType.emailAddress,
                prefix: Icon(Icons.person),
                isRequiredText: true,
                rounded: true,
              ),
              16.verticalSpacingRadius,
              const PasswordInput(
                formControlName: "password",
                title: "Password",
                hint: "Enter Password",
                isRequiredText: true,
                prefix: Icon(Icons.key),
                rounded: true,
              ),
              16.verticalSpacingRadius,
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: c.goForgotPassword,
                  child: Text(
                    "Forgot Password",
                    style: AppStyles.text12PxMedium.copyWith(
                      color: ColorTheme.primary,
                    ),
                  ),
                ),
              ),
              72.verticalSpacingRadius,
              ReactiveFormConsumer(
                builder: (context, formG, child) {
                  return Column(
                    children: [
                      PrimaryButton(
                        onTap: () => c.onLogin(formG.rawValue),
                        title: "Sign in",
                        isEnable: formG.valid,
                      ),
                    ],
                  );
                },
              ),
              32.verticalSpacingRadius,
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: ColorTheme.grey[300],
                      thickness: 1,
                      indent: 24.r,
                      endIndent: 8.r,
                    ),
                  ),
                  Text(
                    "Or Sign in with",
                    style: AppStyles.text14PxMedium.copyWith(
                      color: ColorTheme.grey[300],
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: ColorTheme.grey[300],
                      thickness: 1,
                      indent: 24.r,
                      endIndent: 8.r,
                    ),
                  ),
                ],
              ),
              68.verticalSpacingRadius,
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: AppStyles.text14Px.copyWith(
                      color: ColorTheme.black,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign up here",
                        style: AppStyles.text14PxBold.copyWith(
                          color: ColorTheme.primary,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = c.goRegister,
                      ),
                    ],
                  ),
                ),
              ),
              32.verticalSpacingRadius,
              Align(
                alignment: Alignment.topCenter,
                child: FutureBuilder<DeveloperEntity?>(
                  future: ref.read(developerSourceProvider).developer,
                  builder: (context, ref) {
                    if (ref.connectionState != ConnectionState.done) {
                      if (ref.connectionState == ConnectionState.none) {
                        return Text(
                          'No Version',
                          style: AppStyles.text12Px.copyWith(
                            color: ColorTheme.grey.shade600,
                          ),
                        );
                      }
                      return Text(
                        'Loading...',
                        style: AppStyles.text12Px.copyWith(
                          color: ColorTheme.grey.shade600,
                        ),
                      ).shimmer(isText: true);
                    }
                    return InkWell(
                      onTap: () => c.next(context),
                      child: Text(
                        'Version ${ref.data!.version} ${ref.data!.mode.isNotEmpty && ref.data!.mode != Constants.prod ? '(${ref.data!.mode})' : 'Staging'}',
                        style: AppStyles.text12Px.copyWith(
                          color: ColorTheme.grey.shade600,
                        ),
                      ).pad(8),
                    );
                  },
                ),
              ),
              24.verticalSpacingRadius,
            ],
          ),
        ),
      ),
    );
  }
}
