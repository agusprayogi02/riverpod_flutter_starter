part of 'on_boarding_page.dart';

class OnBoardingController extends StateNotifier<int> {
  OnBoardingController(super.state);

  void next(BuildContext ctx) {
    if (state == 12) {
      ctx.showSnackbar(message: 'masukkan pin untuk masuk mode staging');
      ctx.route.goNamed(DevModePage.path);
      return;
    }
    state++;
  }
}
