// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
