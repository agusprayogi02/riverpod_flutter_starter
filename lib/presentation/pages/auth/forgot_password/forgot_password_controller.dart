part of 'forgot_password_page.dart';

class ForgotPasswordController {
  final form = fb.group({
    'email': ['', Validators.required, Validators.email],
  });
  final BuildContext context;
  ForgotPasswordController({required this.context});

  void goBack() {
    context.route.pop();
  }

  void onSubmit(FormGroup formG) {
    FocusManager.instance.primaryFocus?.unfocus();
    // context.route.goNamed(OtpPage.path, queryParameters: {
    //   "email": formG.rawValue['email'].toString(),
    //   "isResetPassword": true.toString(),
    // });
  }
}
