import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:starter/common/extensions/extensions.dart';

class SessionModel extends Equatable {
  final String? accessToken;
  final String? tokenType;
  final DateTime expiresIn;

  const SessionModel({
    this.accessToken,
    this.tokenType,
    required this.expiresIn,
  });

  factory SessionModel.fromMap(Map<String, Object?> data) => SessionModel(
        accessToken: data['access_token'].toStringX(),
        tokenType: data['token_type'].toStringX(),
        expiresIn: data['expires_in'].toDateX(),
      );

  Map<String, dynamic> toMap() => {
        'access_token': accessToken,
        'token_type': tokenType,
        'expires_in': expiresIn.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SessionModel].
  factory SessionModel.fromJson(String data) {
    return SessionModel.fromMap(json.decode(data) as Map<String, Object?>);
  }

  /// `dart:convert`
  ///
  /// Converts [SessionModel] to a JSON string.
  String toJson() => json.encode(toMap());

  SessionModel copyWith({
    String? accessToken,
    String? tokenType,
    DateTime? expiresIn,
  }) {
    return SessionModel(
      accessToken: accessToken ?? this.accessToken,
      tokenType: tokenType ?? this.tokenType,
      expiresIn: expiresIn ?? this.expiresIn,
    );
  }

  @override
  List<Object?> get props => [accessToken, tokenType, expiresIn];
}
