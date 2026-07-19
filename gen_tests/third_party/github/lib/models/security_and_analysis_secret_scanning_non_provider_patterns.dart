// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/security_and_analysis_secret_scanning_non_provider_patterns_status.dart';
import 'package:meta/meta.dart';

@immutable
class SecurityAndAnalysisSecretScanningNonProviderPatterns {
  const SecurityAndAnalysisSecretScanningNonProviderPatterns({this.status});

  /// Converts a `Map<String, dynamic>` to a
  /// [SecurityAndAnalysisSecretScanningNonProviderPatterns].
  factory SecurityAndAnalysisSecretScanningNonProviderPatterns.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SecurityAndAnalysisSecretScanningNonProviderPatterns',
      json,
      () => SecurityAndAnalysisSecretScanningNonProviderPatterns(
        status:
            SecurityAndAnalysisSecretScanningNonProviderPatternsStatus.maybeFromJson(
              json['status'] as String?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecurityAndAnalysisSecretScanningNonProviderPatterns? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecurityAndAnalysisSecretScanningNonProviderPatterns.fromJson(json);
  }

  final SecurityAndAnalysisSecretScanningNonProviderPatternsStatus? status;

  /// Converts a [SecurityAndAnalysisSecretScanningNonProviderPatterns]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'status': status?.toJson()};
  }

  @override
  int get hashCode => status.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecurityAndAnalysisSecretScanningNonProviderPatterns &&
        status == other.status;
  }
}
