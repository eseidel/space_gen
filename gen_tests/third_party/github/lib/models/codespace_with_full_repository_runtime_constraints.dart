import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CodespaceWithFullRepositoryRuntimeConstraints {
  const CodespaceWithFullRepositoryRuntimeConstraints({
    this.allowedPortPrivacySettings,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespaceWithFullRepositoryRuntimeConstraints].
  factory CodespaceWithFullRepositoryRuntimeConstraints.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespaceWithFullRepositoryRuntimeConstraints',
      json,
      () => CodespaceWithFullRepositoryRuntimeConstraints(
        allowedPortPrivacySettings:
            (json['allowed_port_privacy_settings'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespaceWithFullRepositoryRuntimeConstraints? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespaceWithFullRepositoryRuntimeConstraints.fromJson(json);
  }

  /// The privacy settings a user can select from when forwarding a port.
  final List<String>? allowedPortPrivacySettings;

  /// Converts a [CodespaceWithFullRepositoryRuntimeConstraints]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'allowed_port_privacy_settings': allowedPortPrivacySettings};
  }

  @override
  int get hashCode => listHash(allowedPortPrivacySettings).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespaceWithFullRepositoryRuntimeConstraints &&
        listsEqual(
          allowedPortPrivacySettings,
          other.allowedPortPrivacySettings,
        );
  }
}
