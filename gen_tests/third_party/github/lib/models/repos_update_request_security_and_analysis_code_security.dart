import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template repos_update_request_security_and_analysis_code_security}
/// Use the `status` property to enable or disable GitHub Code Security for this
/// repository.
/// {@endtemplate}
@immutable
class ReposUpdateRequestSecurityAndAnalysisCodeSecurity {
  /// {@macro repos_update_request_security_and_analysis_code_security}
  const ReposUpdateRequestSecurityAndAnalysisCodeSecurity({this.status});

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposUpdateRequestSecurityAndAnalysisCodeSecurity].
  factory ReposUpdateRequestSecurityAndAnalysisCodeSecurity.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposUpdateRequestSecurityAndAnalysisCodeSecurity',
      json,
      () => ReposUpdateRequestSecurityAndAnalysisCodeSecurity(
        status: json['status'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdateRequestSecurityAndAnalysisCodeSecurity? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposUpdateRequestSecurityAndAnalysisCodeSecurity.fromJson(json);
  }

  /// Can be `enabled` or `disabled`.
  final String? status;

  /// Converts a [ReposUpdateRequestSecurityAndAnalysisCodeSecurity]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'status': ?status};
  }

  @override
  int get hashCode => status.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposUpdateRequestSecurityAndAnalysisCodeSecurity &&
        status == other.status;
  }
}
