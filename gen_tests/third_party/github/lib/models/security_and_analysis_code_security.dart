import 'package:github/model_helpers.dart';
import 'package:github/models/security_and_analysis_code_security_status.dart';
import 'package:meta/meta.dart';

@immutable
class SecurityAndAnalysisCodeSecurity {
  const SecurityAndAnalysisCodeSecurity({this.status});

  /// Converts a `Map<String, dynamic>` to a [SecurityAndAnalysisCodeSecurity].
  factory SecurityAndAnalysisCodeSecurity.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SecurityAndAnalysisCodeSecurity',
      json,
      () => SecurityAndAnalysisCodeSecurity(
        status: SecurityAndAnalysisCodeSecurityStatus.maybeFromJson(
          json['status'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecurityAndAnalysisCodeSecurity? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecurityAndAnalysisCodeSecurity.fromJson(json);
  }

  final SecurityAndAnalysisCodeSecurityStatus? status;

  /// Converts a [SecurityAndAnalysisCodeSecurity] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'status': ?status?.toJson()};
  }

  @override
  int get hashCode => status.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecurityAndAnalysisCodeSecurity && status == other.status;
  }
}
