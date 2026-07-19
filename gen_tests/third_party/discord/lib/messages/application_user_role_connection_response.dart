import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationUserRoleConnectionResponse {
  const ApplicationUserRoleConnectionResponse({
    this.platformName,
    this.platformUsername,
    this.metadata,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ApplicationUserRoleConnectionResponse].
  factory ApplicationUserRoleConnectionResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApplicationUserRoleConnectionResponse',
      json,
      () => ApplicationUserRoleConnectionResponse(
        platformName: json['platform_name'] as String?,
        platformUsername: json['platform_username'] as String?,
        metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as String),
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationUserRoleConnectionResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationUserRoleConnectionResponse.fromJson(json);
  }

  final String? platformName;
  final String? platformUsername;
  final Map<String, String>? metadata;

  /// Converts an [ApplicationUserRoleConnectionResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (platformName != null) 'platform_name': platformName,
      'platform_username': platformUsername,
      if (metadata != null) 'metadata': metadata,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([platformName, platformUsername, mapHash(metadata)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationUserRoleConnectionResponse &&
        platformName == other.platformName &&
        platformUsername == other.platformUsername &&
        mapsEqual(metadata, other.metadata);
  }
}
