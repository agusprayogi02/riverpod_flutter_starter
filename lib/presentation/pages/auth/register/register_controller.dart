part of 'register_page.dart';

class RegisterController {
  final formG = fb.group({
    'name': ['', Validators.required],
    'email': ['', Validators.required, Validators.email],
    'password': ['', Validators.required, Validators.minLength(8)],
  });
  final BuildContext context;

  RegisterController(this.context);

  Future<void> onSubmit(FormGroup form) async {
    FocusManager.instance.primaryFocus?.unfocus();
    // final message = await FirebaseMessaging.instance.getToken();
    // final json = form.rawValue;
    // final data = {
    //   'name': json['name'],
    //   'email': json['email'],
    //   'password': json['password'],
    //   'fcm_token': message,
    // };
    // context.read<AuthCubit>().register(data);
    // context.route.goNamed(
    //   OtpPage.path,
    //   queryParameters: {"email": form.controls['email']!.value.toString()},
    // );
  }

  Map<String, String Function(Object)> passwordMessages = {
    ValidationMessage.minLength: (p0) => 'Password Minimal 8 karakter',
  };

  void onLogin() => context.go(LoginPage.path);
}
