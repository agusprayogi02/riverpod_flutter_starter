part of 'theme.dart';

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006e25),
      surfaceTint: Color(0xff006e25),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff28a745),
      onPrimaryContainer: Color(0xff00330d),
      secondary: Color(0xff3b683d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffbcf0b9),
      onSecondaryContainer: Color(0xff416f43),
      tertiary: Color(0xff005eb1),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff3092ff),
      onTertiaryContainer: Color(0xff002a55),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff4fcef),
      onSurface: Color(0xff171d16),
      onSurfaceVariant: Color(0xff3e4a3c),
      outline: Color(0xff6e7b6b),
      outlineVariant: Color(0xffbdcab9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b322a),
      inversePrimary: Color(0xff66df75),
      primaryFixed: Color(0xff83fc8e),
      onPrimaryFixed: Color(0xff002106),
      primaryFixedDim: Color(0xff66df75),
      onPrimaryFixedVariant: Color(0xff00531a),
      secondaryFixed: Color(0xffbcf0b9),
      onSecondaryFixed: Color(0xff002106),
      secondaryFixedDim: Color(0xffa1d39f),
      onSecondaryFixedVariant: Color(0xff235028),
      tertiaryFixed: Color(0xffd5e3ff),
      onTertiaryFixed: Color(0xff001c3b),
      tertiaryFixedDim: Color(0xffa6c8ff),
      onTertiaryFixedVariant: Color(0xff004787),
      surfaceDim: Color(0xffd5dcd0),
      surfaceBright: Color(0xfff4fcef),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff6e9),
      surfaceContainer: Color(0xffe9f0e4),
      surfaceContainerHigh: Color(0xffe3eade),
      surfaceContainerHighest: Color(0xffdde5d9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004012),
      surfaceTint: Color(0xff006e25),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff007f2c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff113f18),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4a774b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00366a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff006dcb),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fcef),
      onSurface: Color(0xff0c130c),
      onSurfaceVariant: Color(0xff2e392c),
      outline: Color(0xff4a5648),
      outlineVariant: Color(0xff647061),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b322a),
      inversePrimary: Color(0xff66df75),
      primaryFixed: Color(0xff007f2c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff006320),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4a774b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff325e35),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff006dcb),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff0055a0),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc1c9bd),
      surfaceBright: Color(0xfff4fcef),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff6e9),
      surfaceContainer: Color(0xffe3eade),
      surfaceContainerHigh: Color(0xffd8dfd3),
      surfaceContainerHighest: Color(0xffcdd4c8),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00340d),
      surfaceTint: Color(0xff006e25),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00561b),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff04340f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff26522a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff002c58),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff00498b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fcef),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff242f23),
      outlineVariant: Color(0xff404c3f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b322a),
      inversePrimary: Color(0xff66df75),
      primaryFixed: Color(0xff00561b),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003c10),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff26522a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff0d3b15),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff00498b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003364),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb4bbaf),
      surfaceBright: Color(0xfff4fcef),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffecf3e7),
      surfaceContainer: Color(0xffdde5d9),
      surfaceContainerHigh: Color(0xffcfd7cb),
      surfaceContainerHighest: Color(0xffc1c9bd),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff66df75),
      surfaceTint: Color(0xff66df75),
      onPrimary: Color(0xff00390f),
      primaryContainer: Color(0xff28a745),
      onPrimaryContainer: Color(0xff00330d),
      secondary: Color(0xffa1d39f),
      onSecondary: Color(0xff093913),
      secondaryContainer: Color(0xff235028),
      onSecondaryContainer: Color(0xff90c18e),
      tertiary: Color(0xffa6c8ff),
      onTertiary: Color(0xff003060),
      tertiaryContainer: Color(0xff3092ff),
      onTertiaryContainer: Color(0xff002a55),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0f150e),
      onSurface: Color(0xffdde5d9),
      onSurfaceVariant: Color(0xffbdcab9),
      outline: Color(0xff879484),
      outlineVariant: Color(0xff3e4a3c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde5d9),
      inversePrimary: Color(0xff006e25),
      primaryFixed: Color(0xff83fc8e),
      onPrimaryFixed: Color(0xff002106),
      primaryFixedDim: Color(0xff66df75),
      onPrimaryFixedVariant: Color(0xff00531a),
      secondaryFixed: Color(0xffbcf0b9),
      onSecondaryFixed: Color(0xff002106),
      secondaryFixedDim: Color(0xffa1d39f),
      onSecondaryFixedVariant: Color(0xff235028),
      tertiaryFixed: Color(0xffd5e3ff),
      onTertiaryFixed: Color(0xff001c3b),
      tertiaryFixedDim: Color(0xffa6c8ff),
      onTertiaryFixedVariant: Color(0xff004787),
      surfaceDim: Color(0xff0f150e),
      surfaceBright: Color(0xff343b33),
      surfaceContainerLowest: Color(0xff091009),
      surfaceContainerLow: Color(0xff171d16),
      surfaceContainer: Color(0xff1b211a),
      surfaceContainerHigh: Color(0xff252c24),
      surfaceContainerHighest: Color(0xff30372e),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff7df588),
      surfaceTint: Color(0xff66df75),
      onPrimary: Color(0xff002d0a),
      primaryContainer: Color(0xff28a745),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffb6e9b3),
      onSecondary: Color(0xff002d0a),
      secondaryContainer: Color(0xff6d9c6c),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffcbddff),
      onTertiary: Color(0xff00264d),
      tertiaryContainer: Color(0xff3092ff),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f150e),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd3e0ce),
      outline: Color(0xffa8b6a4),
      outlineVariant: Color(0xff879484),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde5d9),
      inversePrimary: Color(0xff00541a),
      primaryFixed: Color(0xff83fc8e),
      onPrimaryFixed: Color(0xff001603),
      primaryFixedDim: Color(0xff66df75),
      onPrimaryFixedVariant: Color(0xff004012),
      secondaryFixed: Color(0xffbcf0b9),
      onSecondaryFixed: Color(0xff001603),
      secondaryFixedDim: Color(0xffa1d39f),
      onSecondaryFixedVariant: Color(0xff113f18),
      tertiaryFixed: Color(0xffd5e3ff),
      onTertiaryFixed: Color(0xff001129),
      tertiaryFixedDim: Color(0xffa6c8ff),
      onTertiaryFixedVariant: Color(0xff00366a),
      surfaceDim: Color(0xff0f150e),
      surfaceBright: Color(0xff3f463e),
      surfaceContainerLowest: Color(0xff040904),
      surfaceContainerLow: Color(0xff191f18),
      surfaceContainer: Color(0xff232a22),
      surfaceContainerHigh: Color(0xff2d342c),
      surfaceContainerHighest: Color(0xff394037),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc3ffc0),
      surfaceTint: Color(0xff66df75),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff62db71),
      onPrimaryContainer: Color(0xff000f02),
      secondary: Color(0xffc9fdc6),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff9dcf9b),
      onSecondaryContainer: Color(0xff000f02),
      tertiary: Color(0xffeaf0ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffa0c4ff),
      onTertiaryContainer: Color(0xff000b1e),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0f150e),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe6f4e1),
      outlineVariant: Color(0xffb9c6b5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde5d9),
      inversePrimary: Color(0xff00541a),
      primaryFixed: Color(0xff83fc8e),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff66df75),
      onPrimaryFixedVariant: Color(0xff001603),
      secondaryFixed: Color(0xffbcf0b9),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffa1d39f),
      onSecondaryFixedVariant: Color(0xff001603),
      tertiaryFixed: Color(0xffd5e3ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffa6c8ff),
      onTertiaryFixedVariant: Color(0xff001129),
      surfaceDim: Color(0xff0f150e),
      surfaceBright: Color(0xff4b5249),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1b211a),
      surfaceContainer: Color(0xff2b322a),
      surfaceContainerHigh: Color(0xff363d35),
      surfaceContainerHighest: Color(0xff424940),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
