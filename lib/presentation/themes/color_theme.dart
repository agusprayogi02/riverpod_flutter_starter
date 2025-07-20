part of 'theme.dart';

class ColorTheme {
  static const grey = MaterialColor(0xff667085, <int, Color>{
    50: Color(0xFFF9FAFB),
    100: Color(0xFFF2F4F7),
    200: Color(0xFFEAECF0),
    300: Color(0xFFD0D5DD),
    400: Color(0xFF98A2B3),
    500: Color(0xff667085),
    600: Color(0xff475467),
    700: Color(0xff344054),
    800: Color(0xff1d2939),
    900: Color(0xff080c15),
  });

  static const error = MaterialColor(0xFFF04438, <int, Color>{
    50: Color(0xFFFEF3F2),
    100: Color(0xFFFEE4E2),
    200: Color(0xFFFECDCA),
    300: Color(0xFFFDA29B),
    400: Color(0xFFF97066),
    500: Color(0xFFF04438),
    600: Color(0xFFD92D20),
    700: Color(0xFFB42318),
    800: Color(0xFF912018),
    900: Color(0xFF7A271A),
  });

  static const blue = MaterialColor(0xFF2E90FA, <int, Color>{
    50: Color(0xFFEFF8FF),
    100: Color(0xFFD1E9FF),
    200: Color(0xFFB2DDFF),
    300: Color(0xFF84CAFF),
    400: Color(0xFF53B1FD),
    500: Color(0xFF2E90FA),
    600: Color(0xFF1570EF),
    700: Color(0xFF175CD3),
    800: Color(0xFF1849A9),
    900: Color(0xFF194185),
  });

  static const blueLight = MaterialColor(0xFF0BA5EC, <int, Color>{
    50: Color(0xFFF0F9FF),
    100: Color(0xFFE0F2FE),
    200: Color(0xFFB9E6FE),
    300: Color(0xFF7CD4FD),
    400: Color(0xFF36BFFA),
    500: Color(0xFF0BA5EC),
    600: Color(0xFF0086C9),
    700: Color(0xFF026AA2),
    800: Color(0xFF065986),
    900: Color(0xFF0B4A6F),
  });

  static const warning = MaterialColor(0xFFF79009, <int, Color>{
    50: Color(0xFFFFFAEB),
    100: Color(0xFFFEF0C7),
    200: Color(0xFFFEDF89),
    300: Color(0xFFFEC84B),
    400: Color(0xFFFDB022),
    500: Color(0xFFF79009),
    600: Color(0xFFDC6803),
    700: Color(0xFFB54708),
    800: Color(0xFF93370D),
    900: Color(0xFF7A2E0E),
  });

  static const success = MaterialColor(0xFF12B76A, <int, Color>{
    50: Color(0xFFECFDF3),
    100: Color(0xFFD1FADF),
    200: Color(0xFFA6F4C5),
    300: Color(0xFF6CE9A6),
    400: Color(0xFF32D583),
    500: Color(0xFF12B76A),
    600: Color(0xFF039855),
    700: Color(0xFF027A48),
    800: Color(0xFF05603A),
    900: Color(0xFF054F31),
  });

  static const orange = MaterialColor(0xFFFB6514, <int, Color>{
    50: Color(0xFFFFF6ED),
    100: Color(0xFFFFEAD5),
    200: Color(0xFFFDDCAB),
    300: Color(0xFFFEB173),
    400: Color(0xFFFD853A),
    500: Color(0xFFFB6514),
    600: Color(0xFFEC4A0A),
    700: Color(0xFFC4320A),
    800: Color(0xFF9C2A10),
    900: Color(0xFF7E2410),
  });

  static const white = MaterialColor(0xFFFFFFFF, <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFEFEFEF),
    200: Color(0xFFDCDCDC),
    300: Color(0xFFBDBDBD),
    400: Color(0xFF989898),
    500: Color(0xFF7C7C7C),
    600: Color(0xFF656565),
    700: Color(0xFF525252),
    800: Color(0xFF464646),
    900: Color(0xFF3D3D3D),
    950: Color(0xFF292929),
  });

  //text colors
  static const Color textDark = Color(0xFF222222);
  static const Color textLight = Color(0xFFCFCFCF);
  static const Color textGrey = Color(0xFF999999);
  static const Color shadow = Color(0xFFF4F6F9);
  static const Color textBlue = Color(0xFF3E64D2);

  //status color
  static const Color statusRed = Color(0xFFD23E3E);
  static const Color statusLightRed = Color(0xFFF9E3E3);
  static const Color statusGreen = Color(0xFF4CD964);
  static const Color statusOrange = Color(0xFFFF9212);

  // background colors
  static const Color scaffoldBackground = Color(0xFFF5F5F7);
  static const Color fabRedBackground = Color(0xFFFD6464);
  static const Color brandBackground = Color(0xFFEBEFF9);
  static const Color brandBackgroundLight = Color(0xFFABC4F1);
  static const Color secondaryButtonBackground = Color(0xFFEBEBEB);

  //default
  static const Color border = Color(0xFFD6D6D6);
  static const Color dashBorder = Color(0xFFABC4F1);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;
}
