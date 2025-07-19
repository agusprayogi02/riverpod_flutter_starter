part of 'theme.dart';

class GenerateTheme {
  static InputDecoration inputDecoration(String hint) => InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
        fillColor: Colors.white,
        filled: true,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ColorTheme.primary, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorTheme.grey[200]!, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorTheme.grey[300]!, width: 1),
        ),
      );
  static InputDecoration inputDecorationDropDown(
    String hint, {
    bool rounded = false,
  }) =>
      InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 10.r),
        fillColor: Colors.white,
        filled: true,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(rounded ? 40 : 12),
          borderSide: const BorderSide(color: ColorTheme.primary, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(rounded ? 40 : 12),
          borderSide: BorderSide(color: ColorTheme.grey[200]!, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(rounded ? 40 : 12),
          borderSide: BorderSide(color: ColorTheme.grey[300]!, width: 1),
        ),
      );

  static InputDecoration inputDecorationRounded(String hint) => InputDecoration(
        contentPadding: 12.all,
        fillColor: Colors.white,
        filled: true,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: ColorTheme.primary, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: ColorTheme.primary, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: ColorTheme.grey[200]!, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: ColorTheme.grey[400]!, width: 1),
        ),
      );

  static List<Widget> generateDots(int length, int index) {
    List<Widget> widgets = [];

    for (var i = 0; i < length; i++) {
      widgets.add(
        AnimatedContainer(
          height: (index == i) ? 10 : 6,
          width: (index == i) ? 10 : 6,
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            color: index == i ? ColorTheme.primary : ColorTheme.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }

    return widgets;
  }
}
