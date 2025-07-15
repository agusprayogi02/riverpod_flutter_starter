import 'dart:async';

import 'package:flutter/material.dart';
import 'package:starter/common/logging/logger.dart';
import 'package:starter/presentation/pages/app_page.dart';

Future<void> bootstrap() async {
  return runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      final navigatorKey = GlobalKey<NavigatorState>();

      FlutterError.onError = (FlutterErrorDetails details) {
        logger.error(details.exceptionAsString(), details.exception, details.stack);
      };
      runApp(AppPage(navigatorKey: navigatorKey));
    },
    (Object error, StackTrace stackTrace) => logger.error(error.toString(), error, stackTrace),
  );
}
