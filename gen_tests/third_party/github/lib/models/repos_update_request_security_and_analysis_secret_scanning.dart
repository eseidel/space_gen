import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template repos_update_request_security_and_analysis_secret_scanning}
/// Use the `status` property to enable or disable secret scanning for this
/// repository. For more information, see "[About secret
/// scanning](/code-security/secret-security/about-secret-scanning)."
/// {@endtemplate}
@immutable
class ReposUpdateRequestSecurityAndAnalysisSecretScanning {
  /// {@macro repos_update_request_security_and_analysis_secret_scanning}
  const ReposUpdateRequestSecurityAndAnalysisSecretScanning({this.status});

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposUpdateRequestSecurityAndAnalysisSecretScanning].
  factory ReposUpdateRequestSecurityAndAnalysisSecretScanning.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposUpdateRequestSecurityAndAnalysisSecretScanning',
      json,
      () => ReposUpdateRequestSecurityAndAnalysisSecretScanning(
        status: json['status'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdateRequestSecurityAndAnalysisSecretScanning? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposUpdateRequestSecurityAndAnalysisSecretScanning.fromJson(json);
  }

  /// Can be `enabled` or `disabled`.
  final String? status;

  /// Converts a [ReposUpdateRequestSecurityAndAnalysisSecretScanning]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'status': status};
  }

  @override
  int get hashCode => status.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposUpdateRequestSecurityAndAnalysisSecretScanning &&
        status == other.status;
  }
}
