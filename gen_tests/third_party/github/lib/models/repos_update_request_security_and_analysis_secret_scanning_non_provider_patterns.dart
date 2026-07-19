// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template repos_update_request_security_and_analysis_secret_scanning_non_provider_patterns}
/// Use the `status` property to enable or disable secret scanning non-provider
/// patterns for this repository. For more information, see "[Supported secret
/// scanning
/// patterns](/code-security/secret-scanning/introduction/supported-secret-scanning-patterns#supported-secrets)."
/// {@endtemplate}
@immutable
class ReposUpdateRequestSecurityAndAnalysisSecretScanningNonProviderPatterns {
  /// {@macro repos_update_request_security_and_analysis_secret_scanning_non_provider_patterns}
  const ReposUpdateRequestSecurityAndAnalysisSecretScanningNonProviderPatterns({
    this.status,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposUpdateRequestSecurityAndAnalysisSecretScanningNonProviderPatterns].
  factory ReposUpdateRequestSecurityAndAnalysisSecretScanningNonProviderPatterns.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposUpdateRequestSecurityAndAnalysisSecretScanningNonProviderPatterns',
      json,
      () =>
          ReposUpdateRequestSecurityAndAnalysisSecretScanningNonProviderPatterns(
            status: json['status'] as String?,
          ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdateRequestSecurityAndAnalysisSecretScanningNonProviderPatterns?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReposUpdateRequestSecurityAndAnalysisSecretScanningNonProviderPatterns.fromJson(
      json,
    );
  }

  /// Can be `enabled` or `disabled`.
  final String? status;

  /// Converts a [ReposUpdateRequestSecurityAndAnalysisSecretScanningNonProviderPatterns]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'status': ?status};
  }

  @override
  int get hashCode => status.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ReposUpdateRequestSecurityAndAnalysisSecretScanningNonProviderPatterns &&
        status == other.status;
  }
}
