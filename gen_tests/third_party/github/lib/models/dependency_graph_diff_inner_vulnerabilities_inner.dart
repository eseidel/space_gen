import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class DependencyGraphDiffInnerVulnerabilitiesInner {
  const DependencyGraphDiffInnerVulnerabilitiesInner({
    required this.severity,
    required this.advisoryGhsaId,
    required this.advisorySummary,
    required this.advisoryUrl,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [DependencyGraphDiffInnerVulnerabilitiesInner].
  factory DependencyGraphDiffInnerVulnerabilitiesInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'DependencyGraphDiffInnerVulnerabilitiesInner',
      json,
      () => DependencyGraphDiffInnerVulnerabilitiesInner(
        severity: json['severity'] as String,
        advisoryGhsaId: json['advisory_ghsa_id'] as String,
        advisorySummary: json['advisory_summary'] as String,
        advisoryUrl: json['advisory_url'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependencyGraphDiffInnerVulnerabilitiesInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependencyGraphDiffInnerVulnerabilitiesInner.fromJson(json);
  }

  /// Example: `'critical'`
  final String severity;

  /// Example: `'GHSA-rf4j-j272-fj86'`
  final String advisoryGhsaId;

  /// Example: `'A summary of the advisory.'`
  final String advisorySummary;

  /// Example: `'https://github.com/advisories/GHSA-rf4j-j272-fj86'`
  final String advisoryUrl;

  /// Converts a [DependencyGraphDiffInnerVulnerabilitiesInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'severity': severity,
      'advisory_ghsa_id': advisoryGhsaId,
      'advisory_summary': advisorySummary,
      'advisory_url': advisoryUrl,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([severity, advisoryGhsaId, advisorySummary, advisoryUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependencyGraphDiffInnerVulnerabilitiesInner &&
        severity == other.severity &&
        advisoryGhsaId == other.advisoryGhsaId &&
        advisorySummary == other.advisorySummary &&
        advisoryUrl == other.advisoryUrl;
  }
}
