import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CodespaceRuntimeConstraints {
  const CodespaceRuntimeConstraints({this.allowedPortPrivacySettings});

  /// Converts a `Map<String, dynamic>` to a [CodespaceRuntimeConstraints].
  factory CodespaceRuntimeConstraints.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodespaceRuntimeConstraints',
      json,
      () => CodespaceRuntimeConstraints(
        allowedPortPrivacySettings:
            (json['allowed_port_privacy_settings'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespaceRuntimeConstraints? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespaceRuntimeConstraints.fromJson(json);
  }

  /// The privacy settings a user can select from when forwarding a port.
  final List<String>? allowedPortPrivacySettings;

  /// Converts a [CodespaceRuntimeConstraints] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'allowed_port_privacy_settings': allowedPortPrivacySettings};
  }

  @override
  int get hashCode => listHash(allowedPortPrivacySettings).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespaceRuntimeConstraints &&
        listsEqual(
          allowedPortPrivacySettings,
          other.allowedPortPrivacySettings,
        );
  }
}
