import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter/common/extensions/extensions.dart';
import 'package:starter/data/datasources/session/session_source.dart';
import 'package:starter/presentation/components/base/base_logo.dart';
import 'package:starter/presentation/pages/general/on_boarding/on_boarding_page.dart';
import 'package:starter/presentation/themes/theme.dart';

class SplashPage extends StatefulHookConsumerWidget {
  static const path = '/splash';

  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  late final SessionSource local;
  @override
  void initState() {
    super.initState();
    init();
    local = ref.read(sessionSourceProvider);
  }

  Future<void> init() async {
    await 500.delayedMilliSeconds;
    // await FirebaseMessaging.instance.requestPermission(
    //   alert: true,
    //   announcement: false,
    //   badge: true,
    //   carPlay: false,
    //   criticalAlert: false,
    //   provisional: false,
    //   sound: true,
    // );

    final hasLogin = await local.hasSession;
    if (!hasLogin) {
      context.route.go(OnBoardingPage.path);
      return;
    }

    final session = await local.session;
    // jika expired kurang dari 24 jam maka refresh token
    final beforeExpired = session?.expiresIn.isBefore(DateTime.now().add(24.hours)) ?? false;
    if (beforeExpired) {
      // final repo = locator<AuthRepository>();
      // final rest = await repo.refreshToken();
      // if (rest.isLeft()) {
      //   await local.deleteToken();
      //   context.route.go(OnBoardingPage.path);
      //   return;
      // }
    }

    context.route.go(OnBoardingPage.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: AppCoreTheme.primaryColor),
        child: const BaseLogo(),
      ),
    );
  }
}
