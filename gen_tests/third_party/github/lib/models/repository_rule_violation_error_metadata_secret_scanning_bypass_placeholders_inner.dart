// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/secret_scanning_push_protection_bypass_placeholder_id.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRuleViolationErrorMetadataSecretScanningBypassPlaceholdersInner {
  const RepositoryRuleViolationErrorMetadataSecretScanningBypassPlaceholdersInner({
    this.placeholderId,
    this.tokenType,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleViolationErrorMetadataSecretScanningBypassPlaceholdersInner].
  factory RepositoryRuleViolationErrorMetadataSecretScanningBypassPlaceholdersInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleViolationErrorMetadataSecretScanningBypassPlaceholdersInner',
      json,
      () =>
          RepositoryRuleViolationErrorMetadataSecretScanningBypassPlaceholdersInner(
            placeholderId:
                SecretScanningPushProtectionBypassPlaceholderId.maybeFromJson(
                  json['placeholder_id'] as String?,
                ),
            tokenType: json['token_type'] as String?,
          ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleViolationErrorMetadataSecretScanningBypassPlaceholdersInner?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleViolationErrorMetadataSecretScanningBypassPlaceholdersInner.fromJson(
      json,
    );
  }

  /// The ID of the push protection bypass placeholder. This value is returned
  /// on any push protected routes.
  final SecretScanningPushProtectionBypassPlaceholderId? placeholderId;
  final String? tokenType;

  /// Converts a [RepositoryRuleViolationErrorMetadataSecretScanningBypassPlaceholdersInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (placeholderId != null) 'placeholder_id': placeholderId?.toJson(),
      if (tokenType != null) 'token_type': tokenType,
    };
  }

  @override
  int get hashCode => Object.hashAll([placeholderId, tokenType]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is RepositoryRuleViolationErrorMetadataSecretScanningBypassPlaceholdersInner &&
        placeholderId == other.placeholderId &&
        tokenType == other.tokenType;
  }
}
