// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/repository_rule_violation_error_metadata_secret_scanning_bypass_placeholders_inner.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRuleViolationErrorMetadataSecretScanning {
  const RepositoryRuleViolationErrorMetadataSecretScanning({
    this.bypassPlaceholders,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleViolationErrorMetadataSecretScanning].
  factory RepositoryRuleViolationErrorMetadataSecretScanning.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleViolationErrorMetadataSecretScanning',
      json,
      () => RepositoryRuleViolationErrorMetadataSecretScanning(
        bypassPlaceholders: (json['bypass_placeholders'] as List?)
            ?.map<
              RepositoryRuleViolationErrorMetadataSecretScanningBypassPlaceholdersInner
            >(
              (e) =>
                  RepositoryRuleViolationErrorMetadataSecretScanningBypassPlaceholdersInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleViolationErrorMetadataSecretScanning? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleViolationErrorMetadataSecretScanning.fromJson(json);
  }

  final List<
    RepositoryRuleViolationErrorMetadataSecretScanningBypassPlaceholdersInner
  >?
  bypassPlaceholders;

  /// Converts a [RepositoryRuleViolationErrorMetadataSecretScanning]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'bypass_placeholders': bypassPlaceholders
          ?.map((e) => e.toJson())
          .toList(),
    };
  }

  @override
  int get hashCode => listHash(bypassPlaceholders).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleViolationErrorMetadataSecretScanning &&
        listsEqual(bypassPlaceholders, other.bypassPlaceholders);
  }
}
