import 'package:github/model_helpers.dart';
import 'package:github/models/repository_advisory_update_credits_inner.dart';
import 'package:github/models/repository_advisory_update_severity.dart';
import 'package:github/models/repository_advisory_update_state.dart';
import 'package:github/models/repository_advisory_update_vulnerabilities_inner.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryAdvisoryUpdate {
  const RepositoryAdvisoryUpdate({
    this.summary,
    this.description,
    this.cveId,
    this.vulnerabilities,
    this.cweIds,
    this.credits,
    this.severity,
    this.cvssVectorString,
    this.state,
    this.collaboratingUsers,
    this.collaboratingTeams,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryAdvisoryUpdate].
  factory RepositoryAdvisoryUpdate.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryAdvisoryUpdate',
      json,
      () => RepositoryAdvisoryUpdate(
        summary: json['summary'] as String?,
        description: json['description'] as String?,
        cveId: json['cve_id'] as String?,
        vulnerabilities: (json['vulnerabilities'] as List?)
            ?.map<RepositoryAdvisoryUpdateVulnerabilitiesInner>(
              (e) => RepositoryAdvisoryUpdateVulnerabilitiesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        cweIds: (json['cwe_ids'] as List?)?.cast<String>(),
        credits: (json['credits'] as List?)
            ?.map<RepositoryAdvisoryUpdateCreditsInner>(
              (e) => RepositoryAdvisoryUpdateCreditsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        severity: RepositoryAdvisoryUpdateSeverity.maybeFromJson(
          json['severity'] as String?,
        ),
        cvssVectorString: json['cvss_vector_string'] as String?,
        state: RepositoryAdvisoryUpdateState.maybeFromJson(
          json['state'] as String?,
        ),
        collaboratingUsers: (json['collaborating_users'] as List?)
            ?.cast<String>(),
        collaboratingTeams: (json['collaborating_teams'] as List?)
            ?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryAdvisoryUpdate? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisoryUpdate.fromJson(json);
  }

  /// A short summary of the advisory.
  final String? summary;

  /// A detailed description of what the advisory impacts.
  final String? description;

  /// The Common Vulnerabilities and Exposures (CVE) ID.
  final String? cveId;

  /// A product affected by the vulnerability detailed in a repository
  /// security advisory.
  final List<RepositoryAdvisoryUpdateVulnerabilitiesInner>? vulnerabilities;

  /// A list of Common Weakness Enumeration (CWE) IDs.
  final List<String>? cweIds;

  /// A list of users receiving credit for their participation in the security
  /// advisory.
  final List<RepositoryAdvisoryUpdateCreditsInner>? credits;

  /// The severity of the advisory. You must choose between setting this field
  /// or `cvss_vector_string`.
  final RepositoryAdvisoryUpdateSeverity? severity;

  /// The CVSS vector that calculates the severity of the advisory. You must
  /// choose between setting this field or `severity`.
  final String? cvssVectorString;

  /// The state of the advisory.
  final RepositoryAdvisoryUpdateState? state;

  /// A list of usernames who have been granted write access to the advisory.
  final List<String>? collaboratingUsers;

  /// A list of team slugs which have been granted write access to the
  /// advisory.
  final List<String>? collaboratingTeams;

  /// Converts a [RepositoryAdvisoryUpdate] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'summary': summary,
      'description': description,
      'cve_id': cveId,
      'vulnerabilities': vulnerabilities?.map((e) => e.toJson()).toList(),
      'cwe_ids': cweIds,
      'credits': credits?.map((e) => e.toJson()).toList(),
      'severity': severity?.toJson(),
      'cvss_vector_string': cvssVectorString,
      'state': state?.toJson(),
      'collaborating_users': collaboratingUsers,
      'collaborating_teams': collaboratingTeams,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    summary,
    description,
    cveId,
    listHash(vulnerabilities),
    listHash(cweIds),
    listHash(credits),
    severity,
    cvssVectorString,
    state,
    listHash(collaboratingUsers),
    listHash(collaboratingTeams),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryAdvisoryUpdate &&
        summary == other.summary &&
        description == other.description &&
        cveId == other.cveId &&
        listsEqual(vulnerabilities, other.vulnerabilities) &&
        listsEqual(cweIds, other.cweIds) &&
        listsEqual(credits, other.credits) &&
        severity == other.severity &&
        cvssVectorString == other.cvssVectorString &&
        state == other.state &&
        listsEqual(collaboratingUsers, other.collaboratingUsers) &&
        listsEqual(collaboratingTeams, other.collaboratingTeams);
  }
}
