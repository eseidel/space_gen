import 'package:github/model_helpers.dart';
import 'package:github/models/cvss_severities.dart';
import 'package:github/models/repository_advisory_author.dart';
import 'package:github/models/repository_advisory_credit.dart';
import 'package:github/models/repository_advisory_credits_inner.dart';
import 'package:github/models/repository_advisory_cvss.dart';
import 'package:github/models/repository_advisory_cwes_inner.dart';
import 'package:github/models/repository_advisory_identifiers_inner.dart';
import 'package:github/models/repository_advisory_private_fork.dart';
import 'package:github/models/repository_advisory_publisher.dart';
import 'package:github/models/repository_advisory_severity.dart';
import 'package:github/models/repository_advisory_state.dart';
import 'package:github/models/repository_advisory_submission.dart';
import 'package:github/models/repository_advisory_vulnerability.dart';
import 'package:github/models/simple_user.dart';
import 'package:github/models/team.dart';
import 'package:meta/meta.dart';

/// {@template repository_advisory}
/// A repository security advisory.
/// {@endtemplate}
@immutable
class RepositoryAdvisory {
  /// {@macro repository_advisory}
  const RepositoryAdvisory({
    required this.ghsaId,
    required this.cveId,
    required this.url,
    required this.htmlUrl,
    required this.summary,
    required this.description,
    required this.severity,
    required this.author,
    required this.publisher,
    required this.identifiers,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.closedAt,
    required this.withdrawnAt,
    required this.submission,
    required this.vulnerabilities,
    required this.cvss,
    required this.cwes,
    required this.cweIds,
    required this.credits,
    required this.creditsDetailed,
    required this.collaboratingUsers,
    required this.collaboratingTeams,
    required this.privateFork,
    this.cvssSeverities,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryAdvisory].
  factory RepositoryAdvisory.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryAdvisory',
      json,
      () => RepositoryAdvisory(
        ghsaId: json['ghsa_id'] as String,
        cveId: checkedKey(json, 'cve_id') as String?,
        url: Uri.parse(json['url'] as String),
        htmlUrl: Uri.parse(json['html_url'] as String),
        summary: json['summary'] as String,
        description: checkedKey(json, 'description') as String?,
        severity: RepositoryAdvisorySeverity.maybeFromJson(
          checkedKey(json, 'severity') as String?,
        ),
        author: RepositoryAdvisoryAuthor.maybeFromJson(
          checkedKey(json, 'author') as Map<String, dynamic>?,
        ),
        publisher: RepositoryAdvisoryPublisher.maybeFromJson(
          checkedKey(json, 'publisher') as Map<String, dynamic>?,
        ),
        identifiers: (json['identifiers'] as List)
            .map<RepositoryAdvisoryIdentifiersInner>(
              (e) => RepositoryAdvisoryIdentifiersInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        state: RepositoryAdvisoryState.fromJson(json['state'] as String),
        createdAt: maybeParseDateTime(
          checkedKey(json, 'created_at') as String?,
        ),
        updatedAt: maybeParseDateTime(
          checkedKey(json, 'updated_at') as String?,
        ),
        publishedAt: maybeParseDateTime(
          checkedKey(json, 'published_at') as String?,
        ),
        closedAt: maybeParseDateTime(checkedKey(json, 'closed_at') as String?),
        withdrawnAt: maybeParseDateTime(
          checkedKey(json, 'withdrawn_at') as String?,
        ),
        submission: RepositoryAdvisorySubmission.maybeFromJson(
          checkedKey(json, 'submission') as Map<String, dynamic>?,
        ),
        vulnerabilities: (checkedKey(json, 'vulnerabilities') as List?)
            ?.map<RepositoryAdvisoryVulnerability>(
              (e) => RepositoryAdvisoryVulnerability.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        cvss: RepositoryAdvisoryCvss.maybeFromJson(
          checkedKey(json, 'cvss') as Map<String, dynamic>?,
        ),
        cvssSeverities: CvssSeverities.maybeFromJson(
          json['cvss_severities'] as Map<String, dynamic>?,
        ),
        cwes: (checkedKey(json, 'cwes') as List?)
            ?.map<RepositoryAdvisoryCwesInner>(
              (e) => RepositoryAdvisoryCwesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        cweIds: (checkedKey(json, 'cwe_ids') as List?)?.cast<String>(),
        credits: (checkedKey(json, 'credits') as List?)
            ?.map<RepositoryAdvisoryCreditsInner>(
              (e) => RepositoryAdvisoryCreditsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        creditsDetailed: (checkedKey(json, 'credits_detailed') as List?)
            ?.map<RepositoryAdvisoryCredit>(
              (e) =>
                  RepositoryAdvisoryCredit.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        collaboratingUsers: (checkedKey(json, 'collaborating_users') as List?)
            ?.map<SimpleUser>(
              (e) => SimpleUser.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        collaboratingTeams: (checkedKey(json, 'collaborating_teams') as List?)
            ?.map<Team>((e) => Team.fromJson(e as Map<String, dynamic>))
            .toList(),
        privateFork: RepositoryAdvisoryPrivateFork.maybeFromJson(
          checkedKey(json, 'private_fork') as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryAdvisory? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisory.fromJson(json);
  }

  /// The GitHub Security Advisory ID.
  final String ghsaId;

  /// The Common Vulnerabilities and Exposures (CVE) ID.
  final String? cveId;

  /// The API URL for the advisory.
  final Uri url;

  /// The URL for the advisory.
  final Uri htmlUrl;

  /// A short summary of the advisory.
  final String summary;

  /// A detailed description of what the advisory entails.
  final String? description;

  /// The severity of the advisory.
  final RepositoryAdvisorySeverity? severity;

  /// The author of the advisory.
  final RepositoryAdvisoryAuthor? author;

  /// The publisher of the advisory.
  final RepositoryAdvisoryPublisher? publisher;
  final List<RepositoryAdvisoryIdentifiersInner> identifiers;

  /// The state of the advisory.
  final RepositoryAdvisoryState state;

  /// The date and time of when the advisory was created, in ISO 8601 format.
  final DateTime? createdAt;

  /// The date and time of when the advisory was last updated, in ISO 8601
  /// format.
  final DateTime? updatedAt;

  /// The date and time of when the advisory was published, in ISO 8601
  /// format.
  final DateTime? publishedAt;

  /// The date and time of when the advisory was closed, in ISO 8601 format.
  final DateTime? closedAt;

  /// The date and time of when the advisory was withdrawn, in ISO 8601
  /// format.
  final DateTime? withdrawnAt;
  final RepositoryAdvisorySubmission? submission;
  final List<RepositoryAdvisoryVulnerability>? vulnerabilities;
  final RepositoryAdvisoryCvss? cvss;
  final CvssSeverities? cvssSeverities;
  final List<RepositoryAdvisoryCwesInner>? cwes;

  /// A list of only the CWE IDs.
  final List<String>? cweIds;
  final List<RepositoryAdvisoryCreditsInner>? credits;
  final List<RepositoryAdvisoryCredit>? creditsDetailed;

  /// A list of users that collaborate on the advisory.
  final List<SimpleUser>? collaboratingUsers;

  /// A list of teams that collaborate on the advisory.
  final List<Team>? collaboratingTeams;

  /// A temporary private fork of the advisory's repository for collaborating
  /// on a fix.
  final RepositoryAdvisoryPrivateFork? privateFork;

  /// Converts a [RepositoryAdvisory] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'ghsa_id': ghsaId,
      'cve_id': cveId,
      'url': url.toString(),
      'html_url': htmlUrl.toString(),
      'summary': summary,
      'description': description,
      'severity': severity?.toJson(),
      'author': author?.toJson(),
      'publisher': publisher?.toJson(),
      'identifiers': identifiers.map((e) => e.toJson()).toList(),
      'state': state.toJson(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'published_at': publishedAt?.toIso8601String(),
      'closed_at': closedAt?.toIso8601String(),
      'withdrawn_at': withdrawnAt?.toIso8601String(),
      'submission': submission?.toJson(),
      'vulnerabilities': vulnerabilities?.map((e) => e.toJson()).toList(),
      'cvss': cvss?.toJson(),
      'cvss_severities': cvssSeverities?.toJson(),
      'cwes': cwes?.map((e) => e.toJson()).toList(),
      'cwe_ids': cweIds,
      'credits': credits?.map((e) => e.toJson()).toList(),
      'credits_detailed': creditsDetailed?.map((e) => e.toJson()).toList(),
      'collaborating_users': collaboratingUsers
          ?.map((e) => e.toJson())
          .toList(),
      'collaborating_teams': collaboratingTeams
          ?.map((e) => e.toJson())
          .toList(),
      'private_fork': privateFork?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    ghsaId,
    cveId,
    url,
    htmlUrl,
    summary,
    description,
    severity,
    author,
    publisher,
    listHash(identifiers),
    state,
    createdAt,
    updatedAt,
    publishedAt,
    closedAt,
    withdrawnAt,
    submission,
    listHash(vulnerabilities),
    cvss,
    cvssSeverities,
    listHash(cwes),
    listHash(cweIds),
    listHash(credits),
    listHash(creditsDetailed),
    listHash(collaboratingUsers),
    listHash(collaboratingTeams),
    privateFork,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryAdvisory &&
        ghsaId == other.ghsaId &&
        cveId == other.cveId &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        summary == other.summary &&
        description == other.description &&
        severity == other.severity &&
        author == other.author &&
        publisher == other.publisher &&
        listsEqual(identifiers, other.identifiers) &&
        state == other.state &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        publishedAt == other.publishedAt &&
        closedAt == other.closedAt &&
        withdrawnAt == other.withdrawnAt &&
        submission == other.submission &&
        listsEqual(vulnerabilities, other.vulnerabilities) &&
        cvss == other.cvss &&
        cvssSeverities == other.cvssSeverities &&
        listsEqual(cwes, other.cwes) &&
        listsEqual(cweIds, other.cweIds) &&
        listsEqual(credits, other.credits) &&
        listsEqual(creditsDetailed, other.creditsDetailed) &&
        listsEqual(collaboratingUsers, other.collaboratingUsers) &&
        listsEqual(collaboratingTeams, other.collaboratingTeams) &&
        privateFork == other.privateFork;
  }
}
