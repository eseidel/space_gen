// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template repos_update_request_security_and_analysis_secret_scanning_push_protection}
/// Use the `status` property to enable or disable secret scanning push
/// protection for this repository. For more information, see "[Protecting
/// pushes with secret
/// scanning](/code-security/secret-scanning/protecting-pushes-with-secret-scanning)."
/// {@endtemplate}
@immutable
class ReposUpdateRequestSecurityAndAnalysisSecretScanningPushProtection {
  /// {@macro repos_update_request_security_and_analysis_secret_scanning_push_protection}
  const ReposUpdateRequestSecurityAndAnalysisSecretScanningPushProtection({
    this.status,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposUpdateRequestSecurityAndAnalysisSecretScanningPushProtection].
  factory ReposUpdateRequestSecurityAndAnalysisSecretScanningPushProtection.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposUpdateRequestSecurityAndAnalysisSecretScanningPushProtection',
      json,
      () => ReposUpdateRequestSecurityAndAnalysisSecretScanningPushProtection(
        status: json['status'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdateRequestSecurityAndAnalysisSecretScanningPushProtection?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReposUpdateRequestSecurityAndAnalysisSecretScanningPushProtection.fromJson(
      json,
    );
  }

  /// Can be `enabled` or `disabled`.
  final String? status;

  /// Converts a [ReposUpdateRequestSecurityAndAnalysisSecretScanningPushProtection]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'status': status};
  }

  @override
  int get hashCode => status.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ReposUpdateRequestSecurityAndAnalysisSecretScanningPushProtection &&
        status == other.status;
  }
}
