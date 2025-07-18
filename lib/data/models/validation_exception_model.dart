import 'exception_model.dart';

class ValidationExceptionModel extends ExceptionModel {
  ValidationExceptionModel(this.message, this.payload)
      : super(
          message,
          payload: payload,
          isValidate: true,
        );

  @override
  final String message;
  @override
  final Map<String, dynamic> payload;

  ValidationExceptionModel copyWith({
    String? message,
    Map<String, dynamic>? payload,
  }) {
    return ValidationExceptionModel(
      message ?? this.message,
      payload ?? this.payload,
    );
  }
}
