import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class VoiceRegionResponse {
  const VoiceRegionResponse({
    required this.id,
    required this.name,
    required this.custom,
    required this.deprecated,
    required this.optimal,
  });

  /// Converts a `Map<String, dynamic>` to a [VoiceRegionResponse].
  factory VoiceRegionResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'VoiceRegionResponse',
      json,
      () => VoiceRegionResponse(
        id: json['id'] as String,
        name: json['name'] as String,
        custom: json['custom'] as bool,
        deprecated: json['deprecated'] as bool,
        optimal: json['optimal'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static VoiceRegionResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return VoiceRegionResponse.fromJson(json);
  }

  final String id;
  final String name;
  final bool custom;
  final bool deprecated;
  final bool optimal;

  /// Converts a [VoiceRegionResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'custom': custom,
      'deprecated': deprecated,
      'optimal': optimal,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, name, custom, deprecated, optimal]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is VoiceRegionResponse &&
        id == other.id &&
        name == other.name &&
        custom == other.custom &&
        deprecated == other.deprecated &&
        optimal == other.optimal;
  }
}
