part of 'dev_mode_page.dart';

class DevModeController extends StateNotifier<int> {
  DevModeController(super.state);

  final formG = fb.group({
    'code': FormControl<String>(validators: [Validators.required]),
  });
  final code = "258025";

  Future<void> submit(FormGroup formState, BuildContext context, WidgetRef ref) async {
    if ((formState.rawValue['code'] as String) == code) {
      // PackageInfo packageInfo = await PackageInfo.fromPlatform();
      // final e = DeveloperEntity(
      //   mode: "staging",
      //   baseUrl: "",
      //   version: packageInfo.version,
      // );
      // await locator<DeveloperSource>().setDev(e);
      final e = await ref.read(developerSourceProvider).developer;
      context.route.goNamed(SettingModePage.path, extra: e);
    } else {
      context.showSnackbar(
        message: "Pin yang anda masukkan salah",
        error: true,
        isPop: false,
      );
      formState.reset();
    }
  }
}
