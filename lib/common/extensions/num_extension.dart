import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/currency_utils.dart';

extension NumExtensionX on num {
  Duration get microseconds => Duration(microseconds: toInt());

  Duration get milliseconds => Duration(milliseconds: toInt());

  Duration get seconds => Duration(seconds: toInt());

  Duration get minutes => Duration(minutes: toInt());

  Duration get hours => Duration(hours: toInt());

  Duration get days => Duration(days: toInt());

  Future get delayedMicroSeconds async => Future.delayed(toInt().microseconds);

  Future get delayedMilliSeconds async => Future.delayed(toInt().milliseconds);

  Future get delayedSeconds async => Future.delayed(toInt().seconds);

  Future get delayedMinutes async => Future.delayed(toInt().minutes);

  Future get delayedHours async => Future.delayed(toInt().hours);

  Radius get circular => Radius.circular(toDouble().r);

  BorderRadiusGeometry get rounded => BorderRadius.circular(toDouble().r);

  EdgeInsets get all => EdgeInsets.all(toDouble().r);

  /// Padding with all and half of vertical
  EdgeInsets get allHalfV =>
      EdgeInsets.symmetric(horizontal: toDouble().r, vertical: toDouble().r / 2);

  /// Padding with all and 75% of vertical
  EdgeInsets get allPer3V =>
      EdgeInsets.symmetric(horizontal: toDouble().r, vertical: toDouble().r * .75);

  /// Padding with all and half of horizontal
  EdgeInsets get allHalfH =>
      EdgeInsets.symmetric(horizontal: toDouble().r / 2, vertical: toDouble().r);

  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: toDouble().r);

  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: toDouble().r);
  EdgeInsets get leftP => EdgeInsets.only(left: toDouble().r);
  EdgeInsets get rightP => EdgeInsets.only(right: toDouble().r);
  EdgeInsets get topP => EdgeInsets.only(top: toDouble().r);
  EdgeInsets get bottomP => EdgeInsets.only(bottom: toDouble().r);

  Iterable<int> get range => Iterable<int>.generate(toInt());
  bool get isEmpty => this == 0;

  String get getRandomString {
    const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();
    return String.fromCharCodes(
      Iterable.generate(toInt(), (_) => chars.codeUnitAt(rnd.nextInt(chars.length))),
    );
  }

  String get checkFound => isEmpty ? '-' : toString();

  String get currency => CurrencyUtils.formatCurrency(this);

  String get formatAbs {
    if (this >= 1000000000) {
      double value = this / 1000000000;
      return NumberFormatting.formatWithSuffix(value, 'B');
    } else if (this >= 1000000) {
      double value = this / 1000000;
      return NumberFormatting.formatWithSuffix(value, 'M');
    } else if (this >= 1000) {
      double value = this / 1000;
      return NumberFormatting.formatWithSuffix(value, 'K');
    } else {
      return toString();
    }
  }

  String get formatFileSize {
    const int kb = 1024;
    const int mb = 1024 * 1024;
    const int gb = 1024 * 1024 * 1024;
    final bytes = toInt();

    if (bytes >= gb) {
      return '${(bytes / gb).toStringAsFixed(2)} GB';
    } else if (bytes >= mb) {
      return '${(bytes / mb).toStringAsFixed(2)} MB';
    } else if (bytes >= kb) {
      return '${(bytes / kb).toStringAsFixed(2)} KB';
    } else {
      return '$bytes Bytes';
    }
  }
}

class NumberFormatting {
  static String formatWithSuffix(double value, String suffix) {
    // Check if the value is an integer
    if (value == value.toInt()) {
      return '${value.toInt()}$suffix';
    } else {
      return '${value.toStringAsFixed(1)}$suffix';
    }
  }
}

extension NumSafetyExtensionX on num? {
  bool get isEmpty => this == 0 || this == null;

  String get checkFound => isEmpty ? '-' : toString();

  // from millisecond to second
  num get second => this != null ? this! / 1000 : 0;

  String get toTimeUnit {
    if (this == null) {
      return checkFound;
    }
    if (this! < 60) {
      return "$this seconds";
    } else {
      return "${(this! / 60).toInt()} minutes";
    }
  }

  String get formatAbs {
    if (this == null) {
      return '0';
    }
    if (this! >= 1000000000) {
      double value = this! / 1000000000;
      return NumberFormatting.formatWithSuffix(value, 'B');
    } else if (this! >= 1000000) {
      double value = this! / 1000000;
      return NumberFormatting.formatWithSuffix(value, 'M');
    } else if (this! >= 1000) {
      double value = this! / 1000;
      return NumberFormatting.formatWithSuffix(value, 'K');
    } else {
      return toString();
    }
  }

  String get currency => CurrencyUtils.formatCurrency(this);
  String get formatFileSize {
    if (this == null) {
      return '0 Bytes';
    }
    const int kb = 1024;
    const int mb = 1024 * 1024;
    const int gb = 1024 * 1024 * 1024;
    final bytes = this!.toInt();

    if (bytes >= gb) {
      return '${(bytes / gb).toStringAsFixed(2)} GB';
    } else if (bytes >= mb) {
      return '${(bytes / mb).toStringAsFixed(2)} MB';
    } else if (bytes >= kb) {
      return '${(bytes / kb).toStringAsFixed(2)} KB';
    } else {
      return '$bytes Bytes';
    }
  }
}

extension IntExtensionX on int {
  String get currency => CurrencyUtils.formatCurrency(this);
}

extension IntExtensionXNullable on int? {
  String get currency => CurrencyUtils.formatCurrency(this ?? 0);
}
