import 'package:github/model_helpers.dart';
import 'package:github/models/api_overview_domains_actions_inbound.dart';
import 'package:github/models/api_overview_domains_artifact_attestations.dart';
import 'package:meta/meta.dart';

@immutable
class ApiOverviewDomains {
  const ApiOverviewDomains({
    this.website,
    this.codespaces,
    this.copilot,
    this.packages,
    this.actions,
    this.actionsInbound,
    this.artifactAttestations,
  });

  /// Converts a `Map<String, dynamic>` to an [ApiOverviewDomains].
  factory ApiOverviewDomains.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ApiOverviewDomains',
      json,
      () => ApiOverviewDomains(
        website: (json['website'] as List?)?.cast<String>(),
        codespaces: (json['codespaces'] as List?)?.cast<String>(),
        copilot: (json['copilot'] as List?)?.cast<String>(),
        packages: (json['packages'] as List?)?.cast<String>(),
        actions: (json['actions'] as List?)?.cast<String>(),
        actionsInbound: ApiOverviewDomainsActionsInbound.maybeFromJson(
          json['actions_inbound'] as Map<String, dynamic>?,
        ),
        artifactAttestations:
            ApiOverviewDomainsArtifactAttestations.maybeFromJson(
              json['artifact_attestations'] as Map<String, dynamic>?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApiOverviewDomains? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ApiOverviewDomains.fromJson(json);
  }

  final List<String>? website;
  final List<String>? codespaces;
  final List<String>? copilot;
  final List<String>? packages;
  final List<String>? actions;
  final ApiOverviewDomainsActionsInbound? actionsInbound;
  final ApiOverviewDomainsArtifactAttestations? artifactAttestations;

  /// Converts an [ApiOverviewDomains] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (website != null) 'website': website,
      if (codespaces != null) 'codespaces': codespaces,
      if (copilot != null) 'copilot': copilot,
      if (packages != null) 'packages': packages,
      if (actions != null) 'actions': actions,
      if (actionsInbound != null) 'actions_inbound': actionsInbound?.toJson(),
      if (artifactAttestations != null)
        'artifact_attestations': artifactAttestations?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(website),
    listHash(codespaces),
    listHash(copilot),
    listHash(packages),
    listHash(actions),
    actionsInbound,
    artifactAttestations,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApiOverviewDomains &&
        listsEqual(website, other.website) &&
        listsEqual(codespaces, other.codespaces) &&
        listsEqual(copilot, other.copilot) &&
        listsEqual(packages, other.packages) &&
        listsEqual(actions, other.actions) &&
        actionsInbound == other.actionsInbound &&
        artifactAttestations == other.artifactAttestations;
  }
}
