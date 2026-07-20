import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template dependabot_alert_security_advisory_cvss}
/// Details for the advisory pertaining to the Common Vulnerability Scoring
/// System.
/// {@endtemplate}
@immutable
class DependabotAlertSecurityAdvisoryCvss {
  /// {@macro dependabot_alert_security_advisory_cvss}
  DependabotAlertSecurityAdvisoryCvss({
    required this.score,
    required this.vectorString,
  }) {
    score.validate(min: 0.0, max: 10.0);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [DependabotAlertSecurityAdvisoryCvss].
  factory DependabotAlertSecurityAdvisoryCvss.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'DependabotAlertSecurityAdvisoryCvss',
      json,
      () => DependabotAlertSecurityAdvisoryCvss(
        score: (json['score'] as num).toDouble(),
        vectorString: checkedKey(json, 'vector_string') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependabotAlertSecurityAdvisoryCvss? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependabotAlertSecurityAdvisoryCvss.fromJson(json);
  }

  /// The overall CVSS score of the advisory.
  final double score;

  /// The full CVSS vector string for the advisory.
  final String? vectorString;

  /// Converts a [DependabotAlertSecurityAdvisoryCvss]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'score': score, 'vector_string': vectorString};
  }

  @override
  int get hashCode => Object.hashAll([score, vectorString]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependabotAlertSecurityAdvisoryCvss &&
        score == other.score &&
        vectorString == other.vectorString;
  }
}
