import 'package:github/model_helpers.dart';
import 'package:github/models/cvss_severities.dart';
import 'package:github/models/global_advisory_credits_inner.dart';
import 'package:github/models/global_advisory_cvss.dart';
import 'package:github/models/global_advisory_cwes_inner.dart';
import 'package:github/models/global_advisory_identifiers_inner.dart';
import 'package:github/models/global_advisory_severity.dart';
import 'package:github/models/global_advisory_type.dart';
import 'package:github/models/security_advisory_epss.dart';
import 'package:github/models/vulnerability.dart';
import 'package:meta/meta.dart';

/// {@template global_advisory}
/// A GitHub Security Advisory.
/// {@endtemplate}
@immutable
class GlobalAdvisory {
  /// {@macro global_advisory}
  const GlobalAdvisory({
    required this.ghsaId,
    required this.cveId,
    required this.url,
    required this.htmlUrl,
    required this.repositoryAdvisoryUrl,
    required this.summary,
    required this.description,
    required this.type,
    required this.severity,
    required this.sourceCodeLocation,
    required this.identifiers,
    required this.references,
    required this.publishedAt,
    required this.updatedAt,
    required this.githubReviewedAt,
    required this.nvdPublishedAt,
    required this.withdrawnAt,
    required this.vulnerabilities,
    required this.cvss,
    required this.cwes,
    required this.credits,
    this.cvssSeverities,
    this.epss,
  });

  /// Converts a `Map<String, dynamic>` to a [GlobalAdvisory].
  factory GlobalAdvisory.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GlobalAdvisory',
      json,
      () => GlobalAdvisory(
        ghsaId: json['ghsa_id'] as String,
        cveId: checkedKey(json, 'cve_id') as String?,
        url: json['url'] as String,
        htmlUrl: Uri.parse(json['html_url'] as String),
        repositoryAdvisoryUrl: maybeParseUri(
          checkedKey(json, 'repository_advisory_url') as String?,
        ),
        summary: json['summary'] as String,
        description: checkedKey(json, 'description') as String?,
        type: GlobalAdvisoryType.fromJson(json['type'] as String),
        severity: GlobalAdvisorySeverity.fromJson(json['severity'] as String),
        sourceCodeLocation: maybeParseUri(
          checkedKey(json, 'source_code_location') as String?,
        ),
        identifiers: (checkedKey(json, 'identifiers') as List?)
            ?.map<GlobalAdvisoryIdentifiersInner>(
              (e) => GlobalAdvisoryIdentifiersInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        references: (checkedKey(json, 'references') as List?)?.cast<String>(),
        publishedAt: DateTime.parse(json['published_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        githubReviewedAt: maybeParseDateTime(
          checkedKey(json, 'github_reviewed_at') as String?,
        ),
        nvdPublishedAt: maybeParseDateTime(
          checkedKey(json, 'nvd_published_at') as String?,
        ),
        withdrawnAt: maybeParseDateTime(
          checkedKey(json, 'withdrawn_at') as String?,
        ),
        vulnerabilities: (checkedKey(json, 'vulnerabilities') as List?)
            ?.map<Vulnerability>(
              (e) => Vulnerability.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        cvss: GlobalAdvisoryCvss.maybeFromJson(
          checkedKey(json, 'cvss') as Map<String, dynamic>?,
        ),
        cvssSeverities: CvssSeverities.maybeFromJson(
          json['cvss_severities'] as Map<String, dynamic>?,
        ),
        epss: SecurityAdvisoryEpss.maybeFromJson(
          json['epss'] as Map<String, dynamic>?,
        ),
        cwes: (checkedKey(json, 'cwes') as List?)
            ?.map<GlobalAdvisoryCwesInner>(
              (e) =>
                  GlobalAdvisoryCwesInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        credits: (checkedKey(json, 'credits') as List?)
            ?.map<GlobalAdvisoryCreditsInner>(
              (e) => GlobalAdvisoryCreditsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GlobalAdvisory? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GlobalAdvisory.fromJson(json);
  }

  /// The GitHub Security Advisory ID.
  final String ghsaId;

  /// The Common Vulnerabilities and Exposures (CVE) ID.
  final String? cveId;

  /// The API URL for the advisory.
  final String url;

  /// The URL for the advisory.
  final Uri htmlUrl;

  /// The API URL for the repository advisory.
  final Uri? repositoryAdvisoryUrl;

  /// A short summary of the advisory.
  final String summary;

  /// A detailed description of what the advisory entails.
  final String? description;

  /// The type of advisory.
  final GlobalAdvisoryType type;

  /// The severity of the advisory.
  final GlobalAdvisorySeverity severity;

  /// The URL of the advisory's source code.
  final Uri? sourceCodeLocation;
  final List<GlobalAdvisoryIdentifiersInner>? identifiers;
  final List<String>? references;

  /// The date and time of when the advisory was published, in ISO 8601
  /// format.
  final DateTime publishedAt;

  /// The date and time of when the advisory was last updated, in ISO 8601
  /// format.
  final DateTime updatedAt;

  /// The date and time of when the advisory was reviewed by GitHub, in ISO
  /// 8601 format.
  final DateTime? githubReviewedAt;

  /// The date and time when the advisory was published in the National
  /// Vulnerability Database, in ISO 8601 format.
  /// This field is only populated when the advisory is imported from the
  /// National Vulnerability Database.
  final DateTime? nvdPublishedAt;

  /// The date and time of when the advisory was withdrawn, in ISO 8601
  /// format.
  final DateTime? withdrawnAt;

  /// The products and respective version ranges affected by the advisory.
  final List<Vulnerability>? vulnerabilities;
  final GlobalAdvisoryCvss? cvss;
  final CvssSeverities? cvssSeverities;

  /// The EPSS scores as calculated by the [Exploit Prediction Scoring
  /// System](https://www.first.org/epss).
  final SecurityAdvisoryEpss? epss;
  final List<GlobalAdvisoryCwesInner>? cwes;

  /// The users who contributed to the advisory.
  final List<GlobalAdvisoryCreditsInner>? credits;

  /// Converts a [GlobalAdvisory] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'ghsa_id': ghsaId,
      'cve_id': cveId,
      'url': url,
      'html_url': htmlUrl.toString(),
      'repository_advisory_url': repositoryAdvisoryUrl?.toString(),
      'summary': summary,
      'description': description,
      'type': type.toJson(),
      'severity': severity.toJson(),
      'source_code_location': sourceCodeLocation?.toString(),
      'identifiers': identifiers?.map((e) => e.toJson()).toList(),
      'references': references,
      'published_at': publishedAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'github_reviewed_at': githubReviewedAt?.toIso8601String(),
      'nvd_published_at': nvdPublishedAt?.toIso8601String(),
      'withdrawn_at': withdrawnAt?.toIso8601String(),
      'vulnerabilities': vulnerabilities?.map((e) => e.toJson()).toList(),
      'cvss': cvss?.toJson(),
      'cvss_severities': cvssSeverities?.toJson(),
      'epss': epss?.toJson(),
      'cwes': cwes?.map((e) => e.toJson()).toList(),
      'credits': credits?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    ghsaId,
    cveId,
    url,
    htmlUrl,
    repositoryAdvisoryUrl,
    summary,
    description,
    type,
    severity,
    sourceCodeLocation,
    listHash(identifiers),
    listHash(references),
    publishedAt,
    updatedAt,
    githubReviewedAt,
    nvdPublishedAt,
    withdrawnAt,
    listHash(vulnerabilities),
    cvss,
    cvssSeverities,
    epss,
    listHash(cwes),
    listHash(credits),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GlobalAdvisory &&
        ghsaId == other.ghsaId &&
        cveId == other.cveId &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        repositoryAdvisoryUrl == other.repositoryAdvisoryUrl &&
        summary == other.summary &&
        description == other.description &&
        type == other.type &&
        severity == other.severity &&
        sourceCodeLocation == other.sourceCodeLocation &&
        listsEqual(identifiers, other.identifiers) &&
        listsEqual(references, other.references) &&
        publishedAt == other.publishedAt &&
        updatedAt == other.updatedAt &&
        githubReviewedAt == other.githubReviewedAt &&
        nvdPublishedAt == other.nvdPublishedAt &&
        withdrawnAt == other.withdrawnAt &&
        listsEqual(vulnerabilities, other.vulnerabilities) &&
        cvss == other.cvss &&
        cvssSeverities == other.cvssSeverities &&
        epss == other.epss &&
        listsEqual(cwes, other.cwes) &&
        listsEqual(credits, other.credits);
  }
}
