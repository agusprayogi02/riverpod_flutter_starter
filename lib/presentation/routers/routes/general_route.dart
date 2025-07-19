import 'package:go_router/go_router.dart';
import 'package:starter/data/entities/developer_entity.dart';
import 'package:starter/presentation/pages/general/dev_mode/dev_mode_page.dart';
import 'package:starter/presentation/pages/general/on_boarding/on_boarding_page.dart';
import 'package:starter/presentation/pages/general/setting_mode/setting_mode_page.dart';

class GeneralRoute {
  static final routes = [
    GoRoute(
      path: OnBoardingPage.path,
      name: OnBoardingPage.path,
      builder: (context, state) => const OnBoardingPage(),
    ),
    GoRoute(
      path: DevModePage.path,
      name: DevModePage.path,
      builder: (context, state) => const DevModePage(),
    ),
    GoRoute(
      path: SettingModePage.path,
      name: SettingModePage.path,
      builder: (context, state) => SettingModePage(item: state.extra as DeveloperEntity),
    ),
  ];
}
