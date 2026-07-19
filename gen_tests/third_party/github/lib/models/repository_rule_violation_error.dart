import 'package:github/model_helpers.dart';
import 'package:github/models/repository_rule_violation_error_metadata.dart';
import 'package:meta/meta.dart';

/// {@template repository_rule_violation_error}
/// Repository rule violation was detected
/// {@endtemplate}
@immutable
class RepositoryRuleViolationError {
  /// {@macro repository_rule_violation_error}
  const RepositoryRuleViolationError({
    this.message,
    this.documentationUrl,
    this.status,
    this.metadata,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleViolationError].
  factory RepositoryRuleViolationError.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleViolationError',
      json,
      () => RepositoryRuleViolationError(
        message: json['message'] as String?,
        documentationUrl: json['documentation_url'] as String?,
        status: json['status'] as String?,
        metadata: RepositoryRuleViolationErrorMetadata.maybeFromJson(
          json['metadata'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleViolationError? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleViolationError.fromJson(json);
  }

  final String? message;
  final String? documentationUrl;
  final String? status;
  final RepositoryRuleViolationErrorMetadata? metadata;

  /// Converts a [RepositoryRuleViolationError] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (message != null) 'message': message,
      if (documentationUrl != null) 'documentation_url': documentationUrl,
      if (status != null) 'status': status,
      if (metadata != null) 'metadata': metadata?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([message, documentationUrl, status, metadata]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleViolationError &&
        message == other.message &&
        documentationUrl == other.documentationUrl &&
        status == other.status &&
        metadata == other.metadata;
  }
}
