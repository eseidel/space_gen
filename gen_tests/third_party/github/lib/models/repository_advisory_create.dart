import 'package:github/model_helpers.dart';
import 'package:github/models/repository_advisory_create_credits_inner.dart';
import 'package:github/models/repository_advisory_create_severity.dart';
import 'package:github/models/repository_advisory_create_vulnerabilities_inner.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryAdvisoryCreate {
  const RepositoryAdvisoryCreate({
    required this.summary,
    required this.description,
    required this.vulnerabilities,
    this.cveId,
    this.cweIds,
    this.credits,
    this.severity,
    this.cvssVectorString,
    this.startPrivateFork = false,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryAdvisoryCreate].
  factory RepositoryAdvisoryCreate.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryAdvisoryCreate',
      json,
      () => RepositoryAdvisoryCreate(
        summary: json['summary'] as String,
        description: json['description'] as String,
        cveId: json['cve_id'] as String?,
        vulnerabilities: (json['vulnerabilities'] as List)
            .map<RepositoryAdvisoryCreateVulnerabilitiesInner>(
              (e) => RepositoryAdvisoryCreateVulnerabilitiesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        cweIds: (json['cwe_ids'] as List?)?.cast<String>(),
        credits: (json['credits'] as List?)
            ?.map<RepositoryAdvisoryCreateCreditsInner>(
              (e) => RepositoryAdvisoryCreateCreditsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        severity: RepositoryAdvisoryCreateSeverity.maybeFromJson(
          json['severity'] as String?,
        ),
        cvssVectorString: json['cvss_vector_string'] as String?,
        startPrivateFork: (json['start_private_fork'] as bool?) ?? false,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryAdvisoryCreate? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisoryCreate.fromJson(json);
  }

  /// A short summary of the advisory.
  final String summary;

  /// A detailed description of what the advisory impacts.
  final String description;

  /// The Common Vulnerabilities and Exposures (CVE) ID.
  final String? cveId;

  /// A product affected by the vulnerability detailed in a repository
  /// security advisory.
  final List<RepositoryAdvisoryCreateVulnerabilitiesInner> vulnerabilities;

  /// A list of Common Weakness Enumeration (CWE) IDs.
  final List<String>? cweIds;

  /// A list of users receiving credit for their participation in the security
  /// advisory.
  final List<RepositoryAdvisoryCreateCreditsInner>? credits;

  /// The severity of the advisory. You must choose between setting this field
  /// or `cvss_vector_string`.
  final RepositoryAdvisoryCreateSeverity? severity;

  /// The CVSS vector that calculates the severity of the advisory. You must
  /// choose between setting this field or `severity`.
  final String? cvssVectorString;

  /// Whether to create a temporary private fork of the repository to
  /// collaborate on a fix.
  final bool startPrivateFork;

  /// Converts a [RepositoryAdvisoryCreate] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'summary': summary,
      'description': description,
      'cve_id': cveId,
      'vulnerabilities': vulnerabilities.map((e) => e.toJson()).toList(),
      'cwe_ids': cweIds,
      'credits': credits?.map((e) => e.toJson()).toList(),
      'severity': severity?.toJson(),
      'cvss_vector_string': cvssVectorString,
      'start_private_fork': startPrivateFork,
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
    startPrivateFork,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryAdvisoryCreate &&
        summary == other.summary &&
        description == other.description &&
        cveId == other.cveId &&
        listsEqual(vulnerabilities, other.vulnerabilities) &&
        listsEqual(cweIds, other.cweIds) &&
        listsEqual(credits, other.credits) &&
        severity == other.severity &&
        cvssVectorString == other.cvssVectorString &&
        startPrivateFork == other.startPrivateFork;
  }
}
