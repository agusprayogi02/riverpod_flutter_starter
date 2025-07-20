part of '../theme.dart';

abstract class ButtonStyles {
  static final ButtonStyle roundedReverse = ElevatedButton.styleFrom(
    minimumSize: Size(0, 32.r),
    padding: Constants.btnPadding,
    backgroundColor: ColorTheme.blueLight.shade100,
    foregroundColor: AppCoreTheme.primaryColor,
    textStyle: AppStyles.text12PxSemiBold,
    shape: RoundedRectangleBorder(borderRadius: 32.rounded),
    elevation: 0,
  );

  static final ButtonStyle elevRoundedIcon = ElevatedButton.styleFrom(
    minimumSize: Size(0, 48.r),
    padding: Constants.btnPadding,
    backgroundColor: AppCoreTheme.primaryColor,
    foregroundColor: ColorTheme.white,
    iconColor: ColorTheme.white,
    textStyle: AppStyles.text12Px,
    shape: RoundedRectangleBorder(borderRadius: 32.rounded),
    elevation: 0,
  );

  static final ButtonStyle circleIcon = ElevatedButton.styleFrom(
    minimumSize: Size(48.r, 48.r),
    padding: Constants.btnPadding,
    backgroundColor: AppCoreTheme.primaryColor,
    foregroundColor: ColorTheme.white,
    iconColor: ColorTheme.white,
    textStyle: AppStyles.text12Px,
    shape: RoundedRectangleBorder(borderRadius: 32.rounded),
    elevation: 0,
  );

  static final ButtonStyle iconFilled = IconButton.styleFrom(
    foregroundColor: AppCoreTheme.primaryColor,
    backgroundColor: ColorTheme.grey[100],
    minimumSize: Size(40.r, 40.r),
  );

  static final ButtonStyle iconFilledBlur = IconButton.styleFrom(
    foregroundColor: ColorTheme.white,
    backgroundColor: ColorTheme.black.withAlpha(100),
    minimumSize: Size(32.r, 32.r),
  );
}
