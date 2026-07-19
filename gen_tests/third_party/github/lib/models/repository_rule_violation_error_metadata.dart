import 'package:github/model_helpers.dart';
import 'package:github/models/repository_rule_violation_error_metadata_secret_scanning.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRuleViolationErrorMetadata {
  const RepositoryRuleViolationErrorMetadata({this.secretScanning});

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleViolationErrorMetadata].
  factory RepositoryRuleViolationErrorMetadata.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleViolationErrorMetadata',
      json,
      () => RepositoryRuleViolationErrorMetadata(
        secretScanning:
            RepositoryRuleViolationErrorMetadataSecretScanning.maybeFromJson(
              json['secret_scanning'] as Map<String, dynamic>?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleViolationErrorMetadata? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleViolationErrorMetadata.fromJson(json);
  }

  final RepositoryRuleViolationErrorMetadataSecretScanning? secretScanning;

  /// Converts a [RepositoryRuleViolationErrorMetadata]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'secret_scanning': secretScanning?.toJson()};
  }

  @override
  int get hashCode => secretScanning.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleViolationErrorMetadata &&
        secretScanning == other.secretScanning;
  }
}
