part of 'login_page.dart';

class LoginController extends StateNotifier<int> {
  final BuildContext context;
  final bool isAddAccount;

  LoginController(super.state, {required this.context, required this.isAddAccount});

  final form = fb.group({
    'email': fb.control<String>('', [Validators.required, Validators.email]),
    'password': fb.control<String>('', [Validators.required]),
  });

  Future<void> onLogin(Map<String, dynamic> json, {bool isAddAccount = false}) async {
    if (isAddAccount) {
      context.route.pop(); // you need to define a routerProvider
    } else {
      // final fcmToken = await FirebaseMessaging.instance.getToken();
      // final data = {
      //   'email': json['email'],
      //   'password': json['password'],
      //   'fcm_token': fcmToken,
      // };
      // ref.read(authCubitProvider.notifier).login(data);
    }
  }

  void goRegister() => context.route.goNamed(RegisterPage.path);
  void goForgotPassword() => context.route.pushNamed(ForgotPasswordPage.path);

  void next(BuildContext ctx) {
    if (state == 12) {
      ctx.showSnackbar(message: 'masukkan pin untuk masuk mode staging');
      ctx.route.goNamed(DevModePage.path);
      return;
    }
    state++;
  }
}
