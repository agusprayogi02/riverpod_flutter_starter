import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:starter/presentation/components/app_error_view.dart';
import 'package:starter/presentation/routers/app_router.dart';
import 'package:starter/presentation/themes/theme.dart';

class AppPage extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const AppPage({super.key, required this.navigatorKey});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  late final GoRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter.router(widget.navigatorKey);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (context, child) {
        return FlavorBanner(
          child: MaterialApp.router(
            theme: AppCoreTheme.theme,
            darkTheme: AppCoreTheme.theme,
            debugShowCheckedModeBanner: false,
            routeInformationProvider: _appRouter.routeInformationProvider,
            routeInformationParser: _appRouter.routeInformationParser,
            routerDelegate: _appRouter.routerDelegate,
            builder: (BuildContext context, Widget? child) {
              ErrorWidget.builder = (FlutterErrorDetails details) => AppErrorView(details: details);
              return child!;
            },
          ),
        );
      },
    );
  }
}
