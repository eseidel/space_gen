// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/code_security_create_configuration_request_secret_scanning_delegated_bypass_options_reviewers_inner_reviewer_type.dart';
import 'package:meta/meta.dart';

@immutable
class CodeSecurityCreateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInner {
  const CodeSecurityCreateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInner({
    required this.reviewerId,
    required this.reviewerType,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeSecurityCreateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInner].
  factory CodeSecurityCreateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeSecurityCreateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInner',
      json,
      () => CodeSecurityCreateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInner(
        reviewerId: json['reviewer_id'] as int,
        reviewerType:
            CodeSecurityCreateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInnerReviewerType.fromJson(
              json['reviewer_type'] as String,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeSecurityCreateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInner?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeSecurityCreateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInner.fromJson(
      json,
    );
  }

  /// The ID of the team or role selected as a bypass reviewer
  final int reviewerId;

  /// The type of the bypass reviewer
  final CodeSecurityCreateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInnerReviewerType
  reviewerType;

  /// Converts a [CodeSecurityCreateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'reviewer_id': reviewerId, 'reviewer_type': reviewerType.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([reviewerId, reviewerType]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is CodeSecurityCreateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInner &&
        reviewerId == other.reviewerId &&
        reviewerType == other.reviewerType;
  }
}
