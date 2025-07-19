part of 'setting_mode_page.dart';

class SettingModeController extends StateNotifier<int> {
  final DeveloperEntity item;
  final BuildContext context;
  SettingModeController(super.state, this.item, this.context) {
    form.control('channel').updateValue(item.mode);
  }
  final form = fb.group({
    'channel': FormControl<String>(validators: [Validators.required]),
  });
  final listChannels = [
    {"text": "Production", "value": "production"},
    {"text": "Staging", "value": "staging"},
    {"text": "Beta", "value": "beta"},
  ];

  Future<void> submit(Map<String, dynamic> params, WidgetRef ref) async {
    context.showLoadingIndicator();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final e = DeveloperEntity(
      mode: params["channel"],
      baseUrl: "https://staging.imajibox.com/api/",
      version: packageInfo.version,
    );
    await ref.read(developerSourceProvider).setDev(e);
    context.hideLoading();
    context.route.goNamed(OnBoardingPage.path);
  }
}
