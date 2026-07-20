import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:github/models/cvss_severities.dart';
import 'package:github/models/dependabot_alert_security_advisory_cvss.dart';
import 'package:github/models/dependabot_alert_security_advisory_cwes_inner.dart';
import 'package:github/models/dependabot_alert_security_advisory_identifiers_inner.dart';
import 'package:github/models/dependabot_alert_security_advisory_references_inner.dart';
import 'package:github/models/dependabot_alert_security_advisory_severity.dart';
import 'package:github/models/dependabot_alert_security_vulnerability.dart';
import 'package:github/models/security_advisory_epss.dart';
import 'package:meta/meta.dart';

/// {@template dependabot_alert_security_advisory}
/// Details for the GitHub Security Advisory.
/// {@endtemplate}
@immutable
class DependabotAlertSecurityAdvisory {
  /// {@macro dependabot_alert_security_advisory}
  DependabotAlertSecurityAdvisory({
    required this.ghsaId,
    required this.cveId,
    required this.summary,
    required this.description,
    required this.vulnerabilities,
    required this.severity,
    required this.cvss,
    required this.cwes,
    required this.identifiers,
    required this.references,
    required this.publishedAt,
    required this.updatedAt,
    required this.withdrawnAt,
    this.cvssSeverities,
    this.epss,
  }) {
    summary.validate(maxLength: 1024);
  }

  /// Converts a `Map<String, dynamic>` to a [DependabotAlertSecurityAdvisory].
  factory DependabotAlertSecurityAdvisory.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DependabotAlertSecurityAdvisory',
      json,
      () => DependabotAlertSecurityAdvisory(
        ghsaId: json['ghsa_id'] as String,
        cveId: checkedKey(json, 'cve_id') as String?,
        summary: json['summary'] as String,
        description: json['description'] as String,
        vulnerabilities: (json['vulnerabilities'] as List)
            .map<DependabotAlertSecurityVulnerability>(
              (e) => DependabotAlertSecurityVulnerability.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        severity: DependabotAlertSecurityAdvisorySeverity.fromJson(
          json['severity'] as String,
        ),
        cvss: DependabotAlertSecurityAdvisoryCvss.fromJson(
          json['cvss'] as Map<String, dynamic>,
        ),
        cvssSeverities: CvssSeverities.maybeFromJson(
          json['cvss_severities'] as Map<String, dynamic>?,
        ),
        epss: SecurityAdvisoryEpss.maybeFromJson(
          json['epss'] as Map<String, dynamic>?,
        ),
        cwes: (json['cwes'] as List)
            .map<DependabotAlertSecurityAdvisoryCwesInner>(
              (e) => DependabotAlertSecurityAdvisoryCwesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        identifiers: (json['identifiers'] as List)
            .map<DependabotAlertSecurityAdvisoryIdentifiersInner>(
              (e) => DependabotAlertSecurityAdvisoryIdentifiersInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        references: (json['references'] as List)
            .map<DependabotAlertSecurityAdvisoryReferencesInner>(
              (e) => DependabotAlertSecurityAdvisoryReferencesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        publishedAt: DateTime.parse(json['published_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        withdrawnAt: maybeParseDateTime(
          checkedKey(json, 'withdrawn_at') as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependabotAlertSecurityAdvisory? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependabotAlertSecurityAdvisory.fromJson(json);
  }

  /// The unique GitHub Security Advisory ID assigned to the advisory.
  final String ghsaId;

  /// The unique CVE ID assigned to the advisory.
  final String? cveId;

  /// A short, plain text summary of the advisory.
  final String summary;

  /// A long-form Markdown-supported description of the advisory.
  final String description;

  /// Vulnerable version range information for the advisory.
  final List<DependabotAlertSecurityVulnerability> vulnerabilities;

  /// The severity of the advisory.
  final DependabotAlertSecurityAdvisorySeverity severity;

  /// Details for the advisory pertaining to the Common Vulnerability Scoring
  /// System.
  final DependabotAlertSecurityAdvisoryCvss cvss;
  final CvssSeverities? cvssSeverities;

  /// The EPSS scores as calculated by the [Exploit Prediction Scoring
  /// System](https://www.first.org/epss).
  final SecurityAdvisoryEpss? epss;

  /// Details for the advisory pertaining to Common Weakness Enumeration.
  final List<DependabotAlertSecurityAdvisoryCwesInner> cwes;

  /// Values that identify this advisory among security information sources.
  final List<DependabotAlertSecurityAdvisoryIdentifiersInner> identifiers;

  /// Links to additional advisory information.
  final List<DependabotAlertSecurityAdvisoryReferencesInner> references;

  /// The time that the advisory was published in ISO 8601 format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final DateTime publishedAt;

  /// The time that the advisory was last modified in ISO 8601 format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final DateTime updatedAt;

  /// The time that the advisory was withdrawn in ISO 8601 format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final DateTime? withdrawnAt;

  /// Converts a [DependabotAlertSecurityAdvisory] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'ghsa_id': ghsaId,
      'cve_id': cveId,
      'summary': summary,
      'description': description,
      'vulnerabilities': vulnerabilities.map((e) => e.toJson()).toList(),
      'severity': severity.toJson(),
      'cvss': cvss.toJson(),
      'cvss_severities': cvssSeverities?.toJson(),
      'epss': epss?.toJson(),
      'cwes': cwes.map((e) => e.toJson()).toList(),
      'identifiers': identifiers.map((e) => e.toJson()).toList(),
      'references': references.map((e) => e.toJson()).toList(),
      'published_at': publishedAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'withdrawn_at': withdrawnAt?.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    ghsaId,
    cveId,
    summary,
    description,
    listHash(vulnerabilities),
    severity,
    cvss,
    cvssSeverities,
    epss,
    listHash(cwes),
    listHash(identifiers),
    listHash(references),
    publishedAt,
    updatedAt,
    withdrawnAt,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependabotAlertSecurityAdvisory &&
        ghsaId == other.ghsaId &&
        cveId == other.cveId &&
        summary == other.summary &&
        description == other.description &&
        listsEqual(vulnerabilities, other.vulnerabilities) &&
        severity == other.severity &&
        cvss == other.cvss &&
        cvssSeverities == other.cvssSeverities &&
        epss == other.epss &&
        listsEqual(cwes, other.cwes) &&
        listsEqual(identifiers, other.identifiers) &&
        listsEqual(references, other.references) &&
        publishedAt == other.publishedAt &&
        updatedAt == other.updatedAt &&
        withdrawnAt == other.withdrawnAt;
  }
}
