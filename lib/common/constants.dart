import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Constants {
  static final Map<String, String Function(Object)> messageErrors = {
    ValidationMessage.required: (_) => 'Inputan ini tidak boleh kosong',
    ValidationMessage.email: (_) => 'Email tidak valid',
    ValidationMessage.number: (_) => 'Inputan hanya boleh angka',
    ValidationMessage.minLength: (e) => "Minimal ${(e as Map)['requiredLength']} karakter",
    ValidationMessage.maxLength: (e) => 'Maksimal ${(e as Map)['requiredLength']} karakter',
    'validation_error': (e) => (e as String),
  };
  static EdgeInsets btnPadding = EdgeInsets.symmetric(
    horizontal: 16.r,
    vertical: 8.r,
  );

  static String prod = "production";
}

class ImageAssetConst {
  static String uploadSvg = "assets/icons/upload-filled.svg";
}
