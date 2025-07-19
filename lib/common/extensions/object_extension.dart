import 'package:starter/common/extensions/num_extension.dart';

extension ObjectExtensionExt on Object? {
  int? toIntX() => this == null
      ? null
      : this is bool
          ? this == true
              ? 1
              : 0
          : int.tryParse(toString());

  double? toDoubleX() => this == null ? null : double.tryParse(toString());

  String? toStringX() => this == null ? null : toString();
  String toStringNotNullX() => this == null ? '' : toString();

  num? toNumX() => this == null ? null : num.tryParse(toString());

  bool toBoolX() => this == null
      ? false
      : this is num
          ? this == 1
          : bool.tryParse(toString(), caseSensitive: false) ?? false;

  DateTime toDateX() => this == null
      ? DateTime.now()
      : this is int
          ? DateTime.now().add((this as int).seconds)
          : DateTime.tryParse(toString()) ?? DateTime.now();
}
