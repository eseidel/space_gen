import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template dependabot_alert_security_advisory_cwes_inner}
/// A CWE weakness assigned to the advisory.
/// {@endtemplate}
@immutable
class DependabotAlertSecurityAdvisoryCwesInner {
  /// {@macro dependabot_alert_security_advisory_cwes_inner}
  const DependabotAlertSecurityAdvisoryCwesInner({
    required this.cweId,
    required this.name,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [DependabotAlertSecurityAdvisoryCwesInner].
  factory DependabotAlertSecurityAdvisoryCwesInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'DependabotAlertSecurityAdvisoryCwesInner',
      json,
      () => DependabotAlertSecurityAdvisoryCwesInner(
        cweId: json['cwe_id'] as String,
        name: json['name'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependabotAlertSecurityAdvisoryCwesInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependabotAlertSecurityAdvisoryCwesInner.fromJson(json);
  }

  /// The unique CWE ID.
  final String cweId;

  /// The short, plain text name of the CWE.
  final String name;

  /// Converts a [DependabotAlertSecurityAdvisoryCwesInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'cwe_id': cweId, 'name': name};
  }

  @override
  int get hashCode => Object.hashAll([cweId, name]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependabotAlertSecurityAdvisoryCwesInner &&
        cweId == other.cweId &&
        name == other.name;
  }
}
