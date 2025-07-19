import 'package:go_router/go_router.dart';
import 'package:starter/presentation/pages/auth/forgot_password/forgot_password_page.dart';
import 'package:starter/presentation/pages/auth/login/login_page.dart';
import 'package:starter/presentation/pages/auth/register/register_page.dart';

class AuthRoute {
  static final routes = [
    GoRoute(
      path: LoginPage.path,
      name: LoginPage.path,
      builder: (context, state) => LoginPage(
        isAddAccount: state.extra as bool,
      ),
    ),
    GoRoute(
      path: RegisterPage.path,
      name: RegisterPage.path,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: ForgotPasswordPage.path,
      name: ForgotPasswordPage.path,
      builder: (context, state) => const ForgotPasswordPage(),
    ),
  ];
}
