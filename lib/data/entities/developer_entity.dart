import 'dart:convert';

import 'package:equatable/equatable.dart';

class DeveloperEntity extends Equatable {
  final String mode;
  final String? baseUrl;
  final String version;

  const DeveloperEntity({
    required this.mode,
    this.baseUrl,
    required this.version,
  });

  DeveloperEntity copyWith({String? mode, String? baseUrl, String? version}) {
    return DeveloperEntity(
      mode: mode ?? this.mode,
      baseUrl: baseUrl ?? this.baseUrl,
      version: version ?? this.version,
    );
  }

  Map<String, dynamic> toMap() {
    return {'mode': mode, 'base_url': baseUrl, 'version': version};
  }

  factory DeveloperEntity.fromMap(Map<String, dynamic> map) {
    return DeveloperEntity(
      mode: map['mode'] ?? '',
      baseUrl: map['base_url'] ?? '',
      version: map['version'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory DeveloperEntity.fromJson(String source) => DeveloperEntity.fromMap(jsonDecode(source));

  @override
  List<Object?> get props => [mode, baseUrl, version];
}
