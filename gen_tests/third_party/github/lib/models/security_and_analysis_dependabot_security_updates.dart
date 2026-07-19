import 'package:github/model_helpers.dart';
import 'package:github/models/security_and_analysis_dependabot_security_updates_status.dart';
import 'package:meta/meta.dart';

/// {@template security_and_analysis_dependabot_security_updates}
/// Enable or disable Dependabot security updates for the repository.
/// {@endtemplate}
@immutable
class SecurityAndAnalysisDependabotSecurityUpdates {
  /// {@macro security_and_analysis_dependabot_security_updates}
  const SecurityAndAnalysisDependabotSecurityUpdates({this.status});

  /// Converts a `Map<String, dynamic>` to a
  /// [SecurityAndAnalysisDependabotSecurityUpdates].
  factory SecurityAndAnalysisDependabotSecurityUpdates.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SecurityAndAnalysisDependabotSecurityUpdates',
      json,
      () => SecurityAndAnalysisDependabotSecurityUpdates(
        status:
            SecurityAndAnalysisDependabotSecurityUpdatesStatus.maybeFromJson(
              json['status'] as String?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecurityAndAnalysisDependabotSecurityUpdates? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecurityAndAnalysisDependabotSecurityUpdates.fromJson(json);
  }

  /// The enablement status of Dependabot security updates for the repository.
  final SecurityAndAnalysisDependabotSecurityUpdatesStatus? status;

  /// Converts a [SecurityAndAnalysisDependabotSecurityUpdates]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'status': status?.toJson()};
  }

  @override
  int get hashCode => status.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecurityAndAnalysisDependabotSecurityUpdates &&
        status == other.status;
  }
}
